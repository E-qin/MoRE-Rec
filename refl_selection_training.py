import torch
import numpy as np
from torch.utils.tensorboard import SummaryWriter

import argparse
import json
import random
import pickle
import pandas as pd
import torch.nn as nn
import warnings
import os
import time
from transformers import logging

from rl_select.ppo_selector import PPO_Selector
from rl_select.normalization import Normalization, RewardScaling
from rl_select.replay_buffer import ReplayBuffer
from utils.data import *
from utils.utils import *
from time import time

warnings.filterwarnings("ignore", category=UserWarning)
logging.set_verbosity_error()

def evaluate_policy(args, env, agent):
    times = 3
    evaluate_reward = 0
    for _ in range(times):
        s = env.reset()
        done = False
        episode_reward = 0
        while not done:
            a = agent.evaluate(s)
            s_, r, done, _ = env.step(a)
            episode_reward += r
            s = s_
        evaluate_reward += episode_reward

    return evaluate_reward / times


def main(args, env_name, number, seed):
    env = ReflectEnv()
    env.load_samples(args.valid_sample_path)
    env.load_base_ndcg(args.valid_base_ndcg_path)
    env.load_refl_info_dict(args.CF_refl_path, iter_num=args.iter_num)
    env.load_refl_info_dict(args.EP_refl_path, iter_num=args.iter_num)
    env.load_refl_info_dict(args.IP_refl_path, iter_num=args.iter_num)
    env.load_model(args.dataset_name, args.gpu_id)
    if args.valid_improve_path:
        env.load_improve_info_dict(args.valid_improve_path, iter_num=args.iter_num)
    env.load_all_refl_info()
    env_evaluate = ReflectEnv()
    env_evaluate.load_samples(args.valid_sample_path)
    env_evaluate.load_base_ndcg(args.valid_base_ndcg_path)
    env_evaluate.load_refl_info_dict(args.CF_refl_path, iter_num=args.iter_num)
    env_evaluate.load_refl_info_dict(args.EP_refl_path, iter_num=args.iter_num)
    env_evaluate.load_refl_info_dict(args.IP_refl_path, iter_num=args.iter_num)
    env_evaluate.load_model(args.dataset_name, args.gpu_id)
    env_evaluate.load_all_refl_info()
    if args.valid_improve_path:
        env_evaluate.load_improve_info_dict(args.valid_improve_path, iter_num=args.iter_num)

    # env.seed(seed)
    # env.action_space.seed(seed)
    # env_evaluate.seed(seed)
    # env_evaluate.action_space.seed(seed)
    np.random.seed(seed)
    torch.manual_seed(seed)

    # args.state_dim = env.observation_space.shape[0]
    # args.action_dim = env.action_space.n
    args.max_episode_steps = env.get_max_episode_steps()
    print("env={}".format(env_name))
    print("state_dim={}".format(args.state_dim))
    print("reflect_act_dim={}".format(args.reflect_act_dim))
    print("max_episode_steps={}".format(args.max_episode_steps))

    evaluate_num = 0
    evaluate_rewards = []
    total_steps = 0

    replay_buffer = ReplayBuffer(args)
    selector = PPO_Selector(args)
    last_time = time()
    while total_steps < args.max_train_steps:
        s = env.reset()
        episode_steps = 0
        done = False
        while not done:
            episode_steps += 1
            a, a_logprob = selector.choose_action(s)
            s_, r, done, _ = env.step(a)
            if done and episode_steps != args.max_episode_steps:
                dw = True
            else:
                dw = False
            replay_buffer.store(s, a, a_logprob, r, s_, dw, done)
            s = s_
            total_steps += 1

            if replay_buffer.count == args.batch_size:
                selector.update(replay_buffer, total_steps)
                replay_buffer.count = 0

            if total_steps % args.evaluate_freq == 0:
                evaluate_num += 1
                evaluate_reward = evaluate_policy(args, env_evaluate, selector)
                evaluate_rewards.append(evaluate_reward)
                print("evaluate_num:{} \t evaluate_reward:{} \t".format(evaluate_num, evaluate_reward))
                if evaluate_num % 5 == 0:
                    time_curr = time()
                    print("time elapsed: {:.3f}s".format(time_curr - last_time))
                if evaluate_num % args.save_freq == 0:
                    np.save('./rl_select/Meta-Reflect/{}_PPO_selector_env_{}_number_{}_seed_{}.npy'.format(args.savedir, env_name, number, seed), np.array(evaluate_rewards))
                    selector.save(evaluate_num)

if __name__ == '__main__':
    parser = argparse.ArgumentParser("Hyperparameter Setting for MoRE")
    parser.add_argument("--max_train_steps", type=int, default=int(5e4), help=" Maximum number of training steps")
    parser.add_argument("--evaluate_freq", type=float, default=1e2, help="Evaluate the policy every 'evaluate_freq' steps")
    parser.add_argument("--save_freq", type=int, default=50, help="Save frequency")
    parser.add_argument("-bs", "--batch_size", type=int, default=64, help="Batch size")
    parser.add_argument("-mbs", "--mini_batch_size", type=int, default=64, help="Minibatch size")
    parser.add_argument("--hidden_width", type=int, default=64, help="The number of neurons in hidden layers of the neural network")
    parser.add_argument("--lr_a", type=float, default=1e-4, help="Learning rate of actor")
    parser.add_argument("--lr_c", type=float, default=1e-4, help="Learning rate of critic")
    parser.add_argument("--gamma", type=float, default=0.999, help="Discount factor")
    parser.add_argument("--lamda", type=float, default=0.95, help="GAE parameter")
    parser.add_argument("--epsilon", type=float, default=0.05, help="PPO clip parameter")
    parser.add_argument("--K_epochs", type=int, default=10, help="PPO parameter")
    parser.add_argument("--use_adv_norm", type=bool, default=True, help="advantage normalization")
    parser.add_argument("--use_state_norm", type=bool, default=True, help="state normalization")
    parser.add_argument("--use_reward_norm", type=bool, default=False, help="reward normalization")
    parser.add_argument("--use_reward_scaling", type=bool, default=True, help="reward scaling")
    parser.add_argument("--entropy_coef", type=float, default=0.01, help="policy entropy")
    parser.add_argument("--use_lr_decay", type=bool, default=True, help="learning rate Decay")
    parser.add_argument("--use_grad_clip", type=bool, default=True, help="Gradient clip")
    parser.add_argument("--use_orthogonal_init", type=bool, default=True, help="orthogonal initialization")
    parser.add_argument("--set_adam_eps", type=float, default=True, help="set Adam epsilon=1e-5")
    parser.add_argument("--use_tanh", type=float, default=True, help="tanh activation function")
    parser.add_argument("--savedir", type=str, default='train_model', help="name-saved-model")
    
    parser.add_argument("-sd", "--state_dim", type=int, default=128, help="state's dimension")
    parser.add_argument("-gi", "--gpu_id", type=str, default='3', help="gpu id setup")
    parser.add_argument("-rad", "--reflect_act_dim", type=int, default=4, help="reflect action dimension")
    parser.add_argument("-dn", "--dataset_name", type=str, default='Amazon_Arts', help="dataset name")
    parser.add_argument("-in", "--iter_num", type=int, default=14, help="reflect iteration number")
    parser.add_argument("-vsp", "--valid_sample_path", type=str, default='prepare_cluster_user/dataset/Amazon_Arts/new_valid_samples.json', help="valid sample path")
    parser.add_argument("-vbnp", "--valid_base_ndcg_path", type=str, default='iter_pool/Amazon_Arts_EP_B1_maxFM_cluster_user_first_t1.0_te_new', help="valid base ndcg path")
    parser.add_argument("-crp", "--CF_refl_path", type=str, default='iter_pool/Amazon_Arts_CF_B1_maxFM_cluster_t1.0_te_new', help="CF reflect info dict")
    parser.add_argument("-erp", "--EP_refl_path", type=str, default='iter_pool/Amazon_Arts_EP_B1_maxFM_cluster_user_first_t1.0_te_new', help="EP reflect info dict")
    parser.add_argument("-irp", "--IP_refl_path", type=str, default='iter_pool/Amazon_Arts_IP_B1_maxFM_cluster_t1.0_te_new', help="IP reflect info dict")
    parser.add_argument("-rt", "--random_thresh", type=float, default=0.9, help="exploration paramerter: 1 - random_thresh")
    # no longer used
    parser.add_argument("-vip", "--valid_improve_path", type=str, default='', help="valid improve path")
    
    args = parser.parse_args()
    # environment's name setup
    env_name = ['Reflect_PPO'] 
    env_index = 0
    main(args, env_name=env_name[env_index], number=1, seed=2024)