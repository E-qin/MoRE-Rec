# %%
import transformers
import torch
from prompt.reflect_prompt import *
from pprint import pprint
import json
import os
import fire
from transformers import AutoTokenizer, AutoModelForCausalLM
import tiktoken
from tqdm.contrib import tzip
import pandas as pd
from typing import List
import argparse
import random
import numpy as np
import pdb
from typing import List,Union
from recbole.quick_start import run_recbole
from utils.data import load_data_and_model
from recbole.data.interaction import Interaction
import setproctitle
import datetime


random.seed(2024)
np.random.seed(2024)


parser = argparse.ArgumentParser(description=".")


parser.add_argument('-bs', '--batch_size', type=int, default=10, help='Batch size for rec')
parser.add_argument('-bs2', '--batch_size2', type=int, default=0, help='Batch size for fs')
parser.add_argument('-dn', '--dataset_name', type=str, default='Amazon_Games', help='Dataset name') # key param
parser.add_argument('-mil', '--max_inter_len', type=int, default=20, help='')
parser.add_argument('-ged', '--gold_examples_dir', type=str, default='', help='')
parser.add_argument('-mi', '--max_iter', type=int, default=10, help='')
parser.add_argument('-ex', type=str, default='TRY', help='name of experiment this time')
parser.add_argument('-od', '--output_dir', type=str, default='iter_pool/{dataset_name}_{ex}', help='')
parser.add_argument('-fst', '--fs_temperature', type=float, default=1.0, help='')
parser.add_argument('-fsds', '--fs_do_sample', action='store_true', help='')
parser.add_argument('-rt', '--refl_type', type=str, default='EP', choices=['EP', 'IP', 'CF'], help='')
parser.add_argument('-fm', '--fusion_mode', type=str, default='max', choices=['max','new'], help='')
parser.add_argument('-ofdd', '--original_fs_dict_dir', type=str, 
                    default='tmp/{dataset_name}/sample_prompt_4_greedy', help='')
parser.add_argument('-boo', '--base_on_original', action='store_true', help='true -> use original_fs_dict_dir')
parser.add_argument('-ne', '--no_example', action='store_true', help='true -> no example prompt')
parser.add_argument('-oe', '--one_example', action='store_true', help='true -> only one example prompt')
parser.add_argument('-lbd', '--load_base_dir', type=str, default='', help='load base result/ndcg file dir')
parser.add_argument('-uuc', '--use_user_cluster', action='store_true', help='true -> use user cluster')
parser.add_argument('-uf', '--user_first', action='store_true', help='true -> user first')
parser.add_argument('-dbg', '--DBG', type=int, default=0, help='debug mode')

args = parser.parse_args()
# print all args
pprint(args.__repr__())


# %%
__file__ = os.path.abspath(os.getcwd())
if "CoAuthor2" in __file__:
    model_path = "/data1/CoAuthor2/llama-3/llama3/Meta-Llama-3-8B-Instruct-bf16"
    dataset_path = "/data1/CoAuthor2/Dataset/"
else:
    model_path = '/data1/CoAuthor1/pretrained_models/Meta-Llama-3-8B-Instruct-bf16'
    dataset_path = "/home/CoAuthor1/Py_projects/datasets/"

dataset_name = args.dataset_name
bs = args.batch_size
bs2 = args.batch_size2 if args.batch_size2!=0 else max(int(bs/2),1)
mil = args.max_inter_len
gold_examples_dir = args.gold_examples_dir.format(dataset_name=dataset_name)
original_fs_dict_dir = args.original_fs_dict_dir.format(dataset_name=dataset_name)
output_dir = args.output_dir.format(ex=args.ex,dataset_name=dataset_name)
fs_temperature = args.fs_temperature
fs_do_sample = args.fs_do_sample
refl_type = args.refl_type
args.load_base_dir = args.load_base_dir.format(dataset_name=dataset_name) if args.load_base_dir!='' else ''


setproctitle.setproctitle(f'{dataset_name}|{args.ex}|{datetime.datetime.now().strftime("%Y-%m-%d %H:%M:%S")}')

# %%

tokenizer = AutoTokenizer.from_pretrained(model_path,padding_side='left')
model = AutoModelForCausalLM.from_pretrained(
    model_path,
    torch_dtype=torch.bfloat16,
    device_map="auto",
)
tokenizer.pad_token = tokenizer.bos_token
tokenizer.pad_token_id = tokenizer.bos_token_id

if dataset_name == 'Amazon_Arts':
    CF_model_path = '/data1/CoAuthor1/Py_projects/datasets/Amazon_Arts/DMF-Jul-03-2024_16-11-39.pth'
elif dataset_name == "Amazon_Games":
    CF_model_path = '/data1/CoAuthor1/Py_projects/datasets/Amazon_Games/DMF-Jul-03-2024_16-13-31.pth'
elif dataset_name == "Amazon_Instruments":
    CF_model_path = '/data1/CoAuthor1/Py_projects/datasets/Amazon_Instruments/DMF-Jul-03-2024_16-15-08.pth'
data_path = f'/data1/CoAuthor1/Py_projects/datasets/{dataset_name}'

CF_model = None
dataset = None

config, CF_model, dataset, train_data, valid_data, test_data = load_data_and_model(model_file=CF_model_path, data_path=data_path)
# %%
pprint(rec_prompt)


# %%
item_info_df = pd.read_csv(f"{dataset_path}{dataset_name}/{dataset_name}.item", 
                   sep="\t", header=0, 
                   names=["item_id", "title", "categories", "brand", "sales_type","sales_rank"])
item_info_dict = item_info_df.set_index('item_id').to_dict('index')
# item_info_dict[item_id] =  {'title': 'Creative Ideas 3&quot; Inch Solid Grosgrain Ribbon, 25 Yards, Pink, 25 yd',
                            #  'brand': "'Sewing', 'Ribbons'",
                            #  'categories': 'Creative Ideas',
                            #  'sales_type': 'Arts, Crafts & Sewing',
                            #  'sales_rank': nan}
if os.path.exists(gold_examples_dir):    
    try:                         
        with open(os.path.join(gold_examples_dir,'gold_improves.json'),'r')as f:
            gold_improves = json.load(f)
        with open(os.path.join(gold_examples_dir,'gold_fs_uids.json'),'r')as f:
            gold_fs_uids = json.load(f)
        with open(os.path.join(gold_examples_dir,'gold_fs_info.json'),'r')as f:
            gold_fs_info = json.load(f)
            for uid,imp in zip(gold_fs_uids,gold_improves):
                gold_fs_info[uid]['improve'] = imp
    except:
        with open(os.path.join(gold_examples_dir,'gold_improves_v0.json'),'r')as f:
            gold_improves = json.load(f)
        with open(os.path.join(gold_examples_dir,'gold_fs_uids_v0.json'),'r')as f:
            gold_fs_uids = json.load(f)
        with open(os.path.join(gold_examples_dir,'gold_fs_info_v0.json'),'r')as f:
            gold_fs_info = json.load(f)
            for uid,imp in zip(gold_fs_uids,gold_improves):
                gold_fs_info[uid]['improve'] = imp
else: # NOTE --gold_examples_dir = '', no loading
    gold_improves = []
    gold_fs_uids = []
    gold_fs_info = {}
    
    

# %%
with open(f"prepare_cluster_user/dataset/{dataset_name}/new_valid_samples.json","r")as f:
    valid_samples = json.load(f)
with open(f"prepare_cluster_user/dataset/{dataset_name}/new_test_samples.json","r")as f:
    test_samples = json.load(f)

for uid in valid_samples:
    valid_samples[uid]['-1']['inters'] = valid_samples[uid]['-1']['inters'][-mil:]
    test_samples[uid]['-1']['inters'] = test_samples[uid]['-1']['inters'][-mil:]

with open(f"prepare_cluster_user/dataset_sampled_1000/{dataset_name}/users_1000.json",'r')as f:
    users = json.load(f)

if args.DBG == 1:
    users = users[:10]


# %%
import numpy as np
from tqdm import tqdm

def get_ndcg(rec_list:list,label:str)->float:
    ndcg = 0.0
    for ith,rec_item_title in enumerate(rec_list):
        if label in rec_item_title:
            ndcg = 1/np.log2(ith+2)
            break
    return ndcg
def get_mean(li):
    return sum(li)/len(li)
def rec_str_2_list(response:str)->list:
    return [line for line in response.strip().split('\n') if line]
# get user's cluster
with open(f"prepare_cluster_user/dataset_sampled_1000/{dataset_name}/user_cluster.json","r")as f:
    user_cluster_dict = json.load(f)
def get_user_cluster(user_id):
    cluster_id = user_cluster_dict[user_id]
    return cluster_id

# %%


def llm_generate(model,tokenizer,dialogs:Union[List[List[dict]],List[dict]],**kwargs)->list:
    
    
    input_ids = tokenizer.apply_chat_template(
        dialogs,
        add_generation_prompt=True,
        return_tensors="pt",
        padding=True,
        return_dict= True
    ).to(model.device)
    # print(input_ids['input_ids'].shape)
    
    kwargs["eos_token_id"] =  [
        tokenizer.eos_token_id,
        tokenizer.convert_tokens_to_ids("<|eot_id|>")
    ]
    
    outputs = tokenizer.batch_decode(model.generate(
        **input_ids,
        **kwargs, pad_token_id=tokenizer.bos_token_id
        # max_new_tokens=256,
        # eos_token_id=terminators,
        # do_sample=True,
        # temperature=0.6,
        # top_p=0.9,
    ), skip_special_tokens=True)
    return [output[output.find('assistant\n\n')+11:] for output in outputs]

  

# %%

def get_item_title(item_id:str)->str:
    if item_id in item_info_dict:
        return item_info_dict[item_id]['title']
    return ""
def get_item_category(item_id:str)->dict:
    all_categories = {}
    if item_id in item_info_dict:
        all_categories['title'] = item_info_dict[item_id]['title']
        if pd.isna(item_info_dict[item_id]['categories']):
            all_categories['categories'] = "Unknown"
        else:
            all_categories['categories'] = item_info_dict[item_id]['categories']
        if pd.isna(item_info_dict[item_id]['brand']):
            all_categories['brand'] = "Unknown"
        else:
            all_categories['brand'] = item_info_dict[item_id]['brand']
    return all_categories

def get_user_item_CF_score(user_id,item_id:str):
    # note that user_id has been converted to string, we only need to convert it back to int
    title = get_item_title(item_id)
    item_id = dataset.field2token_id['item_id'][item_id]
    user_id = torch.tensor([int(user_id)])
    item_id = torch.tensor([int(item_id)])
    inter_dict = {'user_id' : user_id, 'item_id' : item_id}
    inter = Interaction(inter_dict)
    return str({'title': title, "CF_score" : float(CF_model.predict(inter))})

def get_items_title(item_ids:list)->list:
    return [get_item_title(item_id) for item_id in item_ids]

def get_items_category(item_ids:list)->list:
    return [get_item_category(item_id) for item_id in item_ids]
def get_user_items_CF_score(user_id,item_ids:list)->list:
    return [get_user_item_CF_score(user_id, item_id) for item_id in item_ids]

# %%
def rec_v2(users,samples,bs=10,refl_data=None):
    result_dict = {}
    ndcg_dict = {}
    last_instruction_dict = {}
    dialogs,uids = [],[]
    for uid in tqdm(users):
        # print("GT:",target_item_title_dict[uid])
        if refl_data==None:
            user_query = rec_prompt.format(inters=get_items_title(samples[uid]['-1']['inters']), # '-1', samples can be from valid or test
                                    candidate_set=get_items_title(samples[uid]['-1']['candidate_set']))
        else:
            user_query = rec_w_reflect_prompt.format(inters=get_items_title(samples[uid]['-1']['inters']), # '-1', samples can be from valid or test
                                    candidate_set=get_items_title(samples[uid]['-1']['candidate_set']),
                                    reflect=refl_data[uid])
        last_instruction_dict[uid] = user_query  
        message = [
            {"role": "system", "content": "You are a recommendation assistant."},
            {"role": "user", "content": user_query},
        ]
        
        dialogs.append(message)
        uids.append(uid)
        
    batch_dialogs = [dialogs[i:i+bs] for i in range(0,len(dialogs),bs)]
    batch_uids = [uids[i:i+bs] for i in range(0,len(uids),bs)]
    
    for dialog_batch,uid_batch in tzip(batch_dialogs,batch_uids):
        outputs = llm_generate(model, tokenizer, dialog_batch, 
                                        
                                max_new_tokens=512, 
                                num_return_sequences=1,
                                do_sample=False,
                                # temperature=0.1, # temperature higher means the more random output, please change this at your own risk
                                # top_p=0.9,
                                )
        for response,uid in zip(outputs,uid_batch):
            rec_list = rec_str_2_list(response) 
            
            result_dict[uid] = rec_list
            ndcg_dict[uid] = get_ndcg(rec_list, label=get_item_title(samples[uid]['-1']['target_item']))
    
    return result_dict,ndcg_dict,last_instruction_dict

def sample_examples(candidates, probabilities,size=2, mode='p'):
    if mode=='p':
        probabilities = np.array(probabilities) / np.sum(probabilities)
        indices = np.random.choice(len(candidates), size=size, replace=False, p=probabilities)
        return [candidates[i] for i in indices]
    elif mode=='random':
        indices = np.random.choice(len(candidates), size=size, replace=False)
        return [candidates[i] for i in indices]

def sample_examples_w_cluster(candidates, probabilities, cluster_id,size=2, mode='p'):
    if candidates == []:
        return []
    # elif len(candidates) == 1:
    #     return candidates
    
    # use cluster_id, only select examples from the same cluster
    all_clusters = []
    for candidate in candidates:
        all_clusters.append(get_user_cluster(candidate))
    # examples are too few, return None
    
    cluster_indices = [i for i in range(len(candidates)) if all_clusters[i] == cluster_id]
    if not cluster_indices:
        return []
    if len(cluster_indices) == 1:
        return [candidates[cluster_indices[0]]]
    
    cluster_indices = np.array(cluster_indices)
    probabilities = np.array(probabilities)
    if mode=='p':
        cluster_probabilities = np.array(probabilities[cluster_indices]) / np.sum(probabilities[cluster_indices])
        indices = np.random.choice(len(cluster_indices), size=size, replace=False, p=cluster_probabilities)
        return [candidates[cluster_indices[i]] for i in indices]
    elif mode=='random':
        indices = np.random.choice(len(cluster_indices), size=size, replace=False)
        return [candidates[cluster_indices[i]] for i in indices]
        

def remove_examples_templete(user_query:str)->str:
    idx1 = user_query.find('Here are some Examples:\n')
    idx2 = user_query.find("Here are the actor's recommendations you need to reflect on now")
    return  user_query[:idx1] + user_query[idx2:]

def remove_1_example_templete(user_query:str)->str:
    idx1 = user_query.find('[Example 2 start]')
    idx2 = user_query.find("Here are the actor's recommendations you need to reflect on now")
    return  user_query[:idx1] + user_query[idx2:]

# def get_examples()
def get_fs_prompt(refl_type:str, instruction, response:str, last_act_his_str:str, user_id=None)->str:
    if args.use_user_cluster:
        try:
            assert user_id is not None 
        except: 
            ValueError("user_id must be provided when using user cluster")
        cluster_id = get_user_cluster(user_id)
    
    if refl_type == 'EP':
        user_query = fs_prompts[refl_type].format(
                    instruction=instruction,
                    response=response,
                    last_act_his_str=last_act_his_str,
                    # last_act_his_str=random.sample(candidate_set_title_dict[uid],10),
                ) 
        if args.no_example or gold_fs_uids==[]: 
            # if there are no gold examples, remove the example part in the query
            user_query = remove_examples_templete(user_query)
        else:
            if args.one_example: # only one example (demonstration) is provided
                user_query = remove_1_example_templete(user_query) # NOTE remove the second example
                if args.use_user_cluster: # Group level refining
                    example_uids = sample_examples_w_cluster(gold_fs_uids,gold_improves,cluster_id,size=1,mode='p')
                else:
                    example_uids = sample_examples(gold_fs_uids,gold_improves,size=1,mode='p') # Global level refining
            else:
                if args.use_user_cluster: # Group level refining
                    example_uids = sample_examples_w_cluster(gold_fs_uids,gold_improves,cluster_id,size=2,mode='p')
                else:
                    example_uids = sample_examples(gold_fs_uids,gold_improves,size=2,mode='p') # Global level refining
                if len(example_uids) == 1:
                    user_query = remove_1_example_templete(user_query)    
            # note that in some clusters, there may be no examples, or only one example        
            if not example_uids:
                user_query = remove_examples_templete(user_query)
            else: 
                if user_id in gold_fs_uids and args.user_first: # Individual level refining
                    example_uids = [user_id] + example_uids
                    example_uids = example_uids[:-1]
                for ith,example_uid in enumerate(example_uids):
                    fs_info = gold_fs_info[example_uid]
                    previous_instruction = fs_info['previous_instruction']
                    target_item = fs_info['target_item']
                    last_act_his = fs_info['last_act_his']
                    fs = fs_info['fs']
                    user_query = user_query.replace(f'[[previous_instruction {ith+1}]]',previous_instruction)
                    user_query = user_query.replace(f'[[target_item {ith+1}]]',get_item_title(target_item))
                    user_query = user_query.replace(f'[[last_act_his {ith+1}]]',str(last_act_his))
                    user_query = user_query.replace(f'[[fs {ith+1}]]',fs)
        

    elif refl_type == 'IP':
        # build the instruction for IP refl prompt
        inters_IP = get_items_category(instruction[0])
        candidate_IP = get_items_category(instruction[1])
        instruction_IP = instruction_meta_example
        instruction_IP = instruction_IP.replace("[[inters_1]]", str(inters_IP))
        instruction_IP = instruction_IP.replace("[[candidate_set_1]]", str(candidate_IP))
        
        response = get_item_category(response)
        user_query = fs_prompts[refl_type].format(
                    instruction=instruction_IP,
                    response=response,
                    last_act_his_str=last_act_his_str,
                    # last_act_his_str=random.sample(candidate_set_title_dict[uid],10),
                ) 
        # TODO
        if args.no_example or gold_fs_uids==[]: 
            # if there are no gold examples, remove the example part in the query
            user_query = remove_examples_templete(user_query)
        else:
            if args.one_example: # only one example (demonstration) is provided
                user_query = remove_1_example_templete(user_query) # NOTE remove the second example
                if args.use_user_cluster:
                    example_uids = sample_examples_w_cluster(gold_fs_uids,gold_improves,cluster_id,size=1,mode='p')
                else:
                    example_uids = sample_examples(gold_fs_uids,gold_improves,size=1,mode='p')
            else:
                if args.use_user_cluster:
                    example_uids = sample_examples_w_cluster(gold_fs_uids,gold_improves,cluster_id,size=2,mode='p')
                else:
                    example_uids = sample_examples(gold_fs_uids,gold_improves,size=2,mode='p')
                if len(example_uids) == 1:
                    user_query = remove_1_example_templete(user_query)
            # Note that in some clusters, there may be no examples, or only one example        
            if not example_uids:
                user_query = remove_examples_templete(user_query)
            else: 
                if user_id in gold_fs_uids and args.user_first: # Individual level refining
                    example_uids = [user_id] + example_uids
                    example_uids = example_uids[:-1]
                for ith,example_uid in enumerate(example_uids):
                    fs_info = gold_fs_info[example_uid]

                    previous_instruction_w_IP = fs_info['previous_instruction']
                    target_item = fs_info['target_item']

                    last_act_his = fs_info['last_act_his']
                    fs = fs_info['fs']
                    user_query = user_query.replace(f'[[item_IP_list {ith+1}]]',previous_instruction_w_IP)
                    user_query = user_query.replace(f'[[target_item {ith+1}]]',get_item_title(target_item))
                    user_query = user_query.replace(f'[[last_act_his {ith+1}]]',str(last_act_his))
                    user_query = user_query.replace(f'[[fs {ith+1}]]',fs)
            
    elif refl_type == 'CF':
        # build the instruction for CF refl prompt
        inters_CF = get_user_items_CF_score(user_id=user_id, item_ids=instruction[0])
        candidate_CF = get_user_items_CF_score(user_id=user_id, item_ids=instruction[1])
        instruction_CF = instruction_meta_example
        instruction_CF = instruction_CF.replace("[[inters_1]]",str(inters_CF))
        instruction_CF = instruction_CF.replace("[[candidate_set_1]]", str(candidate_CF))
        response = get_user_item_CF_score(user_id=user_id, item_id=response)
        user_query = fs_prompts[refl_type].format(
                    instruction=instruction_CF,
                    response=response,
                    last_act_his_str=last_act_his_str,
                    # last_act_his_str=random.sample(candidate_set_title_dict[uid],10),
                ) 

        if args.no_example or gold_fs_uids==[]: 
            user_query = remove_examples_templete(user_query)
        else:
            if args.one_example:
                user_query = remove_1_example_templete(user_query)
                if args.use_user_cluster:
                    example_uids = sample_examples_w_cluster(gold_fs_uids,gold_improves,cluster_id,size=1,mode='p')
                else:
                    example_uids = sample_examples(gold_fs_uids,gold_improves,size=1,mode='p')
            else:
                if args.use_user_cluster:
                    example_uids = sample_examples_w_cluster(gold_fs_uids,gold_improves,cluster_id,size=2,mode='p')
                else:
                    example_uids = sample_examples(gold_fs_uids,gold_improves,size=2,mode='p')
                if len(example_uids) == 1:
                    user_query = remove_1_example_templete(user_query)    
            # note that in some clusters, there may be no examples, or only one example        
            if not example_uids:
                user_query = remove_examples_templete(user_query)
            else:
                if user_id in gold_fs_uids and args.user_first:
                    example_uids = [user_id] + example_uids
                    example_uids = example_uids[:-1]    
                for ith,example_uid in enumerate(example_uids):
                    fs_info = gold_fs_info[example_uid]

                    previous_instruction_w_CF = fs_info['previous_instruction']
                    target_item = fs_info['target_item']

                    last_act_his = fs_info['last_act_his']
                    fs = fs_info['fs']
                    user_query = user_query.replace(f'[[item_CF_scores_list {ith+1}]]',previous_instruction_w_CF)
                    user_query = user_query.replace(f'[[target_item {ith+1}]]',get_item_title(target_item))
                    user_query = user_query.replace(f'[[last_act_his {ith+1}]]',str(last_act_his))
                    user_query = user_query.replace(f'[[fs {ith+1}]]',fs)
    else:   
        raise ValueError("refl_type must be in ['EP','IP','CF']")
    return user_query
    

# %%
def fs_v2(users, samples, last_instruction_dict, base_result_dict, bs=10,refl_type='EP'):
    assert refl_type in ['EP','IP','CF']
    fs_dict = {}
    dialogs,uids = [],[]
    for uid in tqdm(users):
        # print("GT:",target_item_title_dict[uid])
        if refl_type == 'EP':
            user_query = get_fs_prompt(
                refl_type, 
                instruction=last_instruction_dict[uid],
                response=get_item_title(samples[uid]['-1']['target_item']),
                last_act_his_str=base_result_dict[uid],
                user_id=uid
            )
        else:
            user_query = get_fs_prompt(
                refl_type,
                instruction=[samples[uid]['-1']['inters'], samples[uid]['-1']['candidate_set']],
                response=samples[uid]['-1']['target_item'],
                last_act_his_str=base_result_dict[uid],
                user_id=uid
            )
        message = [
            {"role": "system", "content": "You are a recommendation assistant."},
            {"role": "user", "content": user_query},
        ]
        
        dialogs.append(message)
        uids.append(uid)
        
    batch_dialogs = [dialogs[i:i+bs] for i in range(0,len(dialogs),bs)]
    batch_uids = [uids[i:i+bs] for i in range(0,len(uids),bs)]
    for dialog_batch,uid_batch in tzip(batch_dialogs,batch_uids):
        if not fs_do_sample:
            outputs = llm_generate(model, tokenizer, dialog_batch, 
                                            
                                    max_new_tokens=512, 
                                    num_return_sequences=1,
                                    do_sample=False,
                                    )
        else:
            outputs = llm_generate(model, tokenizer, dialog_batch, 
                                            
                                    max_new_tokens=512, 
                                    num_return_sequences=1,
                                    do_sample=True,
                                    temperature=fs_temperature, 
                                    top_p=0.9,
                                    )
        for response,uid in zip(outputs,uid_batch):
            fs_dict[uid] = response
    return fs_dict


# get new iteration's gold_fs_uids, gold_improves
def get_new_good_gold_uids(ndcg_dict,base_ndcg_dict):

    new_good_improves,new_good_fs_uids = [],[]
    new_gold_improves,new_gold_fs_uids = [],[]
    for uid in users:
        if base_ndcg_dict[uid] < ndcg_dict[uid]:
            improve = ndcg_dict[uid]-base_ndcg_dict[uid]
            new_good_fs_uids.append(uid)
            new_good_improves.append(improve)
            if 0.5 <= ndcg_dict[uid]: # top 3
                new_gold_fs_uids.append(uid)
                new_gold_improves.append(improve)
                
            
    return dict(new_good_improves=new_good_improves,new_good_fs_uids=new_good_fs_uids,
                new_gold_improves=new_gold_improves,new_gold_fs_uids=new_gold_fs_uids)


def fusion_gold_pool(new_dict, valid_fs_dict, valid_base_result_dict,last_instruction_dict,
                     fusion_mode='max', good_as_gold=False):
    new_gold_improves = new_dict['new_gold_improves'] if not good_as_gold else new_dict['new_good_improves']
    new_gold_fs_uids = new_dict['new_gold_fs_uids'] if not good_as_gold else new_dict['new_good_fs_uids']
    
    # update gold_fs_info with new iteration's infomation
    new_gold_fs_info = {}
    for uid,improve in zip(new_gold_fs_uids,new_gold_improves):
        target_item_id = valid_samples[uid]['-1']['target_item']
        new_gold_fs_info[uid] = dict(last_act_his=valid_base_result_dict[uid],
                                fs=valid_fs_dict[uid],
                                #  target_item=dict(id=target_item_id, title=get_item_title(target_item_id)),
                                target_item=get_item_title(target_item_id),
                                previous_instruction=last_instruction_dict[uid],
                                improve=improve)
    
  
    
    if fusion_mode == 'new':
        for uid in gold_fs_info:
            if uid not in new_gold_fs_info:
                new_gold_fs_info[uid] = gold_fs_info[uid] # fusion the new_gold_fs_info with the old one if the user is not in the new_gold_fs_info
    elif fusion_mode == 'max':
        for uid in gold_fs_info:
            if uid not in new_gold_fs_info:
                new_gold_fs_info[uid] = gold_fs_info[uid] # fusion the new_gold_fs_info with the old one if the user is not in the new_gold_fs_info
            else:
                old_imp = gold_fs_info[uid]['improve']
                new_imp = new_gold_fs_info[uid]['improve']
                if new_imp < old_imp:
                    new_gold_fs_info[uid] = gold_fs_info[uid] 
    else:
        raise ValueError("fusion_mode must be in ['max','new']")
    
    return new_gold_fs_info
    
os.makedirs(output_dir,exist_ok=True)
    

# %%

if args.load_base_dir:
    try:
        with open(os.path.join(args.load_base_dir,"valid_base_result_dict.json"),"r")as f:
            valid_base_result_dict = json.load(f)
        with open(os.path.join(args.load_base_dir,"valid_base_ndcg_dict.json"),"r")as f:
            valid_base_ndcg_dict = json.load(f)
        with open(os.path.join(args.load_base_dir,"last_instruction_dict.json"),"r")as f:
            last_instruction_dict = json.load(f)
        print("||valid_base_result_dict,valid_base_ndcg_dict,last_instruction_dict loaded!")
    except:
        print("||WARNING: args.load_base_dir is provided but valid_base_result_dict.json or valid_base_ndcg_dict.json is not found!")
        valid_base_result_dict, \
            valid_base_ndcg_dict, \
            last_instruction_dict = rec_v2(users,valid_samples,bs=bs)
        with open(os.path.join(output_dir,"valid_base_result_dict.json"),"w")as f:
            json.dump(valid_base_result_dict,f)
        with open(os.path.join(output_dir,"valid_base_ndcg_dict.json"),"w")as f:
            json.dump(valid_base_ndcg_dict,f)
        with open(os.path.join(output_dir,"last_instruction_dict.json"),"w")as f:
            json.dump(last_instruction_dict,f)
        
else:
    print("||No base_dir provided! Start from scratch......")
    valid_base_result_dict, \
        valid_base_ndcg_dict, \
        last_instruction_dict = rec_v2(users,valid_samples,bs=bs)
    with open(os.path.join(output_dir,"valid_base_result_dict.json"),"w")as f:
        json.dump(valid_base_result_dict,f)
    with open(os.path.join(output_dir,"valid_base_ndcg_dict.json"),"w")as f:
        json.dump(valid_base_ndcg_dict,f)
    with open(os.path.join(output_dir,"last_instruction_dict.json"),"w")as f:
        json.dump(last_instruction_dict,f)
print()
print('='*10)
print("||>>> base valid_ndcg",get_mean(valid_base_ndcg_dict.values())) # 0.32762017669973675
print('='*10)
print()

# os.makedirs("tmp",exist_ok=True)
# os.makedirs(f"tmp/{dataset_name}",exist_ok=True)
# # save valid base result
# with open(f"tmp/{dataset_name}/valid_base_result_dict.json","w")as f:
#     json.dump(valid_base_result_dict,f)
# with open(f"tmp/{dataset_name}/valid_base_ndcg_dict.json","w")as f:
#     json.dump(valid_base_ndcg_dict,f)
# with open(f"tmp/{dataset_name}/last_instruction_dict.json","w")as f:
#     json.dump(last_instruction_dict,f)  
    

# %%
if args.load_base_dir:
    try:
        with open(os.path.join(args.load_base_dir,"test_base_result_dict.json"),"r")as f:
            test_base_result_dict = json.load(f)
        with open(os.path.join(args.load_base_dir,"test_base_ndcg_dict.json"),"r")as f:
            test_base_ndcg_dict = json.load(f)
        print("||test_base_result_dict,test_base_ndcg_dict loaded!")
    except:
        print("||WARNING: args.load_base_dir is provided but test_base_result_dict.json or test_base_ndcg_dict.json is not found!")
        test_base_result_dict, \
            test_base_ndcg_dict, \
            test_last_instruction_dict = rec_v2(users,test_samples,bs=bs)
        with open(os.path.join(output_dir,"test_base_result_dict.json"),"w")as f:
            json.dump(test_base_result_dict,f)
        with open(os.path.join(output_dir,"test_base_ndcg_dict.json"),"w")as f:
            json.dump(test_base_ndcg_dict,f)
else:
    print("||No base_dir provided! Start from scratch......")
    test_base_result_dict, \
        test_base_ndcg_dict, \
        test_last_instruction_dict = rec_v2(users,test_samples,bs=bs)
    with open(os.path.join(output_dir,"test_base_result_dict.json"),"w")as f:
        json.dump(test_base_result_dict,f)
    with open(os.path.join(output_dir,"test_base_ndcg_dict.json"),"w")as f:
        json.dump(test_base_ndcg_dict,f)
print()
print('='*10)
print("||>>> base test_ndcg",get_mean(test_base_ndcg_dict.values())) 
print('='*10)
print()



# os.makedirs("tmp",exist_ok=True)
# os.makedirs(f"tmp/{dataset_name}",exist_ok=True)
# # save valid base result
# with open(f"tmp/{dataset_name}/test_base_result_dict.json","w")as f:
#     json.dump(test_base_result_dict,f)
# with open(f"tmp/{dataset_name}/test_base_ndcg_dict.json","w")as f:
#     json.dump(test_base_ndcg_dict,f)
# with open(f"tmp/{dataset_name}/test_last_instruction_dict.json","w")as f:
#     json.dump(test_last_instruction_dict,f)



# # %%
# with open(f"tmp/{dataset_name}/last_instruction_dict.json","r")as f:
#     last_instruction_dict = json.load(f) # valid base query
# with open(f"tmp/{dataset_name}/valid_base_result_dict.json","r")as f:
#     valid_base_result_dict = json.load(f)
# with open(f"tmp/{dataset_name}/valid_base_ndcg_dict.json",'r')as f:
#     valid_base_ndcg_dict = json.load(f)
# with open(f"tmp/{dataset_name}/test_base_ndcg_dict.json",'r')as f:
#     test_base_ndcg_dict = json.load(f)




for iter_i in range(args.max_iter):
    if iter_i == 0 and args.base_on_original:
        with open(os.path.join(original_fs_dict_dir,'valid_fs_dict.json'),"r")as f:
            valid_fs_dict = json.load(f)  
        with open(os.path.join(original_fs_dict_dir,'valid_refl1_result_dict.json'),"r")as f:
            valid_refl1_result_dict = json.load(f)
        with open(os.path.join(original_fs_dict_dir,'valid_refl1_ndcg_dict.json'),"r")as f:
            valid_refl1_ndcg_dict = json.load(f)
    else:
        valid_fs_dict = fs_v2(users,
                                valid_samples,
                                last_instruction_dict,
                                valid_base_result_dict,
                                refl_type=refl_type,bs=bs2)

        valid_refl1_result_dict, \
            valid_refl1_ndcg_dict, _ = rec_v2(users,valid_samples,
                                                refl_data=valid_fs_dict,bs=bs)
    print()
    print('='*10)
    print(f'||>>> iter_{iter_i} valid_ndcg',round(get_mean(valid_refl1_ndcg_dict.values()),6)) # 0.33868528072345416
    print('='*10)
    print()

    
    print("||get_new_good_gold_uids... ")
    # get new iteration's gold_fs_uids, gold_improves, gold_fs_info
    new_dict = get_new_good_gold_uids(valid_refl1_ndcg_dict, valid_base_ndcg_dict)
    # fusion gold pool
    print("||fusion_gold_pool... ")
    new_gold_fs_info = fusion_gold_pool(new_dict,
                     valid_fs_dict,
                     valid_base_result_dict,
                     last_instruction_dict,
                     fusion_mode=args.fusion_mode, good_as_gold=False)
    # replace global gold_fs_info
    print("||replace global gold_fs_info... {}-->{}".format(len(gold_fs_info),len(new_gold_fs_info)))
    gold_fs_info = new_gold_fs_info
    gold_fs_uids = list(new_gold_fs_info.keys())
    gold_improves = [new_gold_fs_info[uid]['improve'] for uid in gold_fs_uids]

    # # %%
    if iter_i == 0 and args.base_on_original:
        with open(os.path.join(original_fs_dict_dir,'test_refl1_result_dict.json'),"r")as f:
            test_refl1_result_dict = json.load(f)
        with open(os.path.join(original_fs_dict_dir,'test_refl1_ndcg_dict.json'),"r")as f:
            test_refl1_ndcg_dict = json.load(f)
    else:
        test_refl1_result_dict, \
            test_refl1_ndcg_dict, _ = rec_v2(users,test_samples,refl_data=valid_fs_dict,bs=bs)
    print()
    print('='*10)
    print(f'||>>> iter_{iter_i} test_ndcg',round(get_mean(test_refl1_ndcg_dict.values()),6)) # 0.33868528072345416
    print('='*10)
    print()
    
    
    with open(os.path.join(output_dir,f"iter_{iter_i}.json"),"w")as f:
        json.dump(
            dict(test_refl1_result_dict=test_refl1_result_dict,
                 test_refl1_ndcg_dict=test_refl1_ndcg_dict,
                 valid_refl1_ndcg_dict=valid_refl1_ndcg_dict,
                 valid_refl1_result_dict=valid_refl1_result_dict,gold_fs_info=gold_fs_info),f)




# # %%
# # print former ndcg results to check
# print('='*20)
# print('='*20)
# print("valid_base_ndcg",get_mean(valid_base_ndcg_dict.values())) # 0.32762017669973675
# print('valid_refl1_ndcg',get_mean(valid_refl1_ndcg_dict.values())) # 0.33868528072345416
# print('test_refl1_ndcg',get_mean(test_refl1_ndcg_dict.values())) # 0.33868528072345416
# print('='*20)
# print('='*20)
# print("Done!")

