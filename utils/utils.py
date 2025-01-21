import numpy as np
import json
import os
from utils.data import generate_final_candidate_emb, load_CF_SAS, generate_candidate_emb
import random
import numpy as np
from tqdm import tqdm


class ReflectUtils:
    def __init__(self):
        self.refl_type_set=['title', 'attribute', 'CF']
        self.valid_base_info_dict = {}
        self.test_base_info_dict = {}
        self.EP_refl_info_dict = {}
        self.IP_refl_info_dict = {}
        self.CF_refl_info_dict = {}
        self.refl_info_dict_list = []
        self.feedback_thresh = 0.05
        self.CF_model = None
        self.CF_dataset = None
        self.SAS_model = None
        self.SAS_dataset = None

    def load_model(self, dataset_name="Amazon_Arts", gpu_id='0'):
        self.CF_model, self.CF_dataset, self.SAS_model, self.SAS_dataset = load_CF_SAS(dataset_name, gpu_id)
    
    def load_base_ndcg(self, data_path=None):
        with open(data_path + "/valid_base_ndcg_dict.json", 'r') as f:
            self.valid_base_info_dict = json.load(f)
        with open(data_path + "/test_base_ndcg_dict.json", "r") as f:
            self.test_base_info_dict = json.load(f)

    def load_refl_info_dict(self, data_path=None, iter_num=0):
        if "title" in data_path:
            with open(data_path + '/iter_{}.json'.format(iter_num), 'r') as f:
                self.EP_refl_info_dict = json.load(f)
        elif "attr" in data_path:
            with open(data_path + '/iter_{}.json'.format(iter_num), 'r') as f:
                self.IP_refl_info_dict = json.load(f)
        elif "CF" in data_path:
            with open(data_path + '/iter_{}.json'.format(iter_num), 'r') as f:
                self.CF_refl_info_dict = json.load(f)

    def load_all_refl_info(self):
        self.refl_info_dict_list = [self.EP_refl_info_dict, self.CF_refl_info_dict, self.IP_refl_info_dict]

    def make_candidate_set(self, user_id=None, item_list=None, arm_size=None):
        candidate_vector = []
        for i in range(2 ** arm_size):
            curr_candidate = generate_final_candidate_emb(user_id, item_list, i)
            candidate_vector.append(curr_candidate)
        return np.array(candidate_vector).reshape(-1)

    def make_candidate_set_single_type(self, user_id=None, item_list=None, arm_size=None):
        candidate_vector = []
        for i in range(arm_size):
            curr_candidate = generate_final_candidate_emb(user_id, item_list, i, self.CF_model, self.CF_dataset, self.SAS_model, self.SAS_dataset)
            candidate_vector.append(curr_candidate)
        return np.array(candidate_vector)

    def make_candidate_embedding(self, user_id=None, item_list=None):
        return generate_candidate_emb(user_id, item_list, self.CF_model, self.CF_dataset, self.SAS_model, self.SAS_dataset)

    def get_reflect_feedback_from_dict(self, user_id, arm_id):
        # return reflect feedback from dict
        assert arm_id in range(3)
        refl_ndcg = self.refl_info_dict_list[arm_id]['valid_refl1_ndcg_dict'][user_id]
        base_ndcg = self.valid_base_info_dict[user_id]
        feedback = refl_ndcg - base_ndcg
        return feedback

class ReflectEnv(ReflectUtils):
    def __init__(self):
        self.shufflelist = []
        self.samples = {}
        self.improve_info_dict = {}
    def load_improve_info_dict(self, data_path=None, iter_num=0):
        if data_path:
            with open(data_path + '/iter_{}.json'.format(iter_num), 'r') as f:
                self.improve_info_dict = json.load(f)
    def load_samples(self, data_path=None):
        # f"prepare_cluster_user/dataset/{dataset_name}/new_valid_samples.json"
        with open(data_path, "r")as f:
            self.samples = json.load(f)
    def get_max_episode_steps(self):
        return len(self.valid_base_info_dict.keys())
    def reset(self):
        assert self.valid_base_info_dict
        self.shufflelist = []
        for user in self.valid_base_info_dict.keys():
            self.shufflelist.append(user)
        random.shuffle(self.shufflelist)
        self.count = 0
        next_uid = self.shufflelist[self.count]
        self.state = self.make_candidate_embedding(user_id=next_uid, item_list=self.samples[next_uid]['-1']['inters'])
        return self.state
    def step(self, action):
        flag = False
        last_uid = self.shufflelist[self.count]
        # action = 3 means we do not select any reflect
        if action >= 3:
            reward = 0
        else:
            reward = self.get_reflect_feedback_from_dict(user_id=last_uid, arm_id=action)
            if self.improve_info_dict and action == 0: # title reflect uses reward rectify method
                if last_uid in self.improve_info_dict['gold_fs_info'].keys():
                    reward += self.improve_info_dict['gold_fs_info'][last_uid]['improve']
            # if we added reflect, after this if reward <= 0, then reflect will be defined as -1
            # reward = reward if reward > 0 else -1
        self.count += 1
        if self.count == len(self.shufflelist):
            flag = True
        else:
            next_uid = self.shufflelist[self.count]
            self.state = self.make_candidate_embedding(user_id=next_uid, item_list=self.samples[next_uid]['-1']['inters'])

        return self.state, reward, flag, None
    def close(self):
        return None
        
    
def get_metric(rec_list:list,label:str,metric='ndcg',top_k=10)->float:
    metrics = 0.0
    for ith,rec_item_title in enumerate(rec_list[:top_k]):
        if label in rec_item_title:
            if metric=='hit':
                metrics = 1  
            elif metric=='ndcg':
                metrics = 1/np.log2(ith+2) 
            else: 
                raise ValueError(f"metric:{metric} is not supported!")
            break
    return metrics


def get_ndcg(rec_list:list,label:str)->float:
    ndcg = 0.0
    for ith,rec_item_title in enumerate(rec_list):
        if label in rec_item_title:
            ndcg = 1/np.log2(ith+2)
            break
    return ndcg
# compute the mean of a list
def get_mean(li):
    return sum(li)/len(li)


def get_samples(test_samples, target_ith_in_inters, seed=2024):
    new_samples = {}
    for uid in test_samples:
        test_inters = test_samples[uid]['-1']['inters']
        test_target_item = test_samples[uid]['-1']['target_item']
        test_candidate_set = test_samples[uid]['-1']['candidate_set']
        
        new_target_item = test_inters[target_ith_in_inters]
        new_inters = test_inters[:target_ith_in_inters]
        new_candidate_set = [new_target_item] + [item for item in test_candidate_set if item != test_target_item]
        
        random.seed(seed)
        random.shuffle(new_candidate_set)
        # find the index of test_target_item in new_candidate_set, and then delete it, finally add new_target_item
        new_samples[uid]={}
        new_samples[uid]['-1']={}
        new_samples[uid]['-1']['inters'] = new_inters
        new_samples[uid]['-1']['target_item'] = new_target_item
        new_samples[uid]['-1']['candidate_set'] = new_candidate_set
        
    return new_samples

def load_base_data(load_base_dir,mode):
    with open(os.path.join(load_base_dir,f"{mode}_base_result_dict.json"),"r")as f:
        base_result_dict = json.load(f)
    with open(os.path.join(load_base_dir,f"{mode}_base_ndcg_dict.json"),"r")as f:
        base_ndcg_dict = json.load(f)
    with open(os.path.join(load_base_dir,f"{mode}_last_instruction_dict.json"),"r")as f:
        last_instruction_dict = json.load(f)
    with open(os.path.join(load_base_dir,f"{mode}_base_metric_dict_dict.json"),"r")as f:
        base_metric_dict = json.load(f)
    return base_result_dict, base_ndcg_dict, last_instruction_dict, base_metric_dict


def save_base_data(base_result_dict,
                   base_ndcg_dict,
                   last_instruction_dict, 
                   base_metric_dict, 
                   save_base_dir,mode):
    with open(os.path.join(save_base_dir,f"{mode}_base_result_dict.json"),"w")as f:
        json.dump(base_result_dict,f)
    with open(os.path.join(save_base_dir,f"{mode}_base_ndcg_dict.json"),"w")as f:
        json.dump(base_ndcg_dict,f)
    with open(os.path.join(save_base_dir,f"{mode}_last_instruction_dict.json"),"w")as f:
        json.dump(last_instruction_dict,f)
    with open(os.path.join(save_base_dir,f"{mode}_base_metric_dict_dict.json"),"w")as f:
        json.dump(base_metric_dict,f)
        
        
def convert_seconds_to_time(seconds):
    hours = seconds // 3600  # compute the hours
    minutes = (seconds % 3600) // 60  # convert the remaining seconds to minutes
    remaining_seconds = seconds % 60  # compute the seconds

    # change the output style: hh:mm:ss
    if seconds > 3600:
        return f"{hours}hours,  {minutes:.3f}minutes."
    elif seconds > 60:
        return f"{minutes}minutes,  {remaining_seconds:.3f}seconds."
    else:
        return f"{seconds:.3f}seconds."



def post_process_fs(fs):
    s_list = fs.split("\n")
    s_list = [s for s in s_list if 'PREFERENCE' in s or "ANALYSIS" in s or 'SUGGESTIONS' in s]
    return s_list