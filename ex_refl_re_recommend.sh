
# dataset_name='Amazon_Games'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=12
# ppo_model_name="run_ppo_train_model_epoch_100.pth"
# refl_ver=3
# ex="PPO_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}" # remember to change
# CUDA_VISIBLE_DEVICES=3  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 0\
#     > log/${ex}_${dataset_name}-2024-07-26.log 2>&1 &

# dataset_name='Amazon_Games'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=12
# ppo_model_name="run_ppo_train_model_epoch_100.pth"
# refl_ver=3
# ex="Greedy_select_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}" # remember to change
# CUDA_VISIBLE_DEVICES=3  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 0\
#     --greedy_selection \
#     > log/${ex}_${dataset_name}-2024-07-26.log 2>&1 &

# dataset_name='Amazon_Games'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=12
# arm_size=3
# epoch=450
# ppo_model_name="run_ppo_rt_0.9_bs_128_${arm_size}_arm_0_train_model_epoch_${epoch}.pth"
# refl_ver=3
# ex="PPO_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}_a_${arm_size}_ep_${epoch}" # remember to change
# CUDA_VISIBLE_DEVICES=6  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 0\
#     --gpu_memory_utilization 0.7\
#     --arm_size ${arm_size}\
#     > log/${ex}_${dataset_name}-2024-07-28.log 2>&1 &

# dataset_name='Amazon_Games'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=12
# arm_size=4
# epoch=450
# ppo_model_name="run_ppo_rt_0.9_bs_128_${arm_size}_arm_0_train_model_epoch_${epoch}.pth"
# refl_ver=3
# ex="PPO_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}_a_${arm_size}_ep_${epoch}" # remember to change
# CUDA_VISIBLE_DEVICES=6  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 22\
#     --gpu_memory_utilization 0.7\
#     --arm_size ${arm_size}\
#     > log/${ex}_${dataset_name}-2024-07-28.log 2>&1 &

# dataset_name='Amazon_Arts'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=12
# arm_size=3
# epoch=200
# ppo_model_name="run_ppo_rt_0.9_bs_128_${arm_size}_arm_0_train_model_epoch_${epoch}.pth"
# refl_ver=3
# ex="PPO_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}_a_${arm_size}_ep_${epoch}" # remember to change
# CUDA_VISIBLE_DEVICES=6  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 45\
#     --gpu_memory_utilization 0.7\
#     --arm_size ${arm_size}\
#     > log/${ex}_${dataset_name}-2024-07-28.log 2>&1 &

# dataset_name='Amazon_Arts'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=12
# arm_size=4
# epoch=200
# ppo_model_name="run_ppo_rt_0.9_bs_128_${arm_size}_arm_0_train_model_epoch_${epoch}.pth"
# refl_ver=3
# ex="PPO_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}_a_${arm_size}_ep_${epoch}" # remember to change
# CUDA_VISIBLE_DEVICES=6  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 70\
#     --gpu_memory_utilization 0.7\
#     --arm_size ${arm_size}\
#     > log/${ex}_${dataset_name}-2024-07-28.log 2>&1 &

# dataset_name='Amazon_Instruments'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=12
# arm_size=3
# epoch=500
# ppo_model_name="run_ppo_rt_0.9_bs_128_${arm_size}_arm_0_train_model_epoch_${epoch}.pth"
# refl_ver=3
# ex="PPO_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}_a_${arm_size}_ep_${epoch}" # remember to change
# CUDA_VISIBLE_DEVICES=6  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 95\
#     --gpu_memory_utilization 0.7\
#     --arm_size ${arm_size}\
#     > log/${ex}_${dataset_name}-2024-07-28.log 2>&1 &

# dataset_name='Amazon_Instruments'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=12
# arm_size=4
# epoch=500
# ppo_model_name="run_ppo_rt_0.9_bs_128_${arm_size}_arm_0_train_model_epoch_${epoch}.pth"
# refl_ver=3
# ex="PPO_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}_a_${arm_size}_ep_${epoch}" # remember to change
# CUDA_VISIBLE_DEVICES=6  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 120\
#     --gpu_memory_utilization 0.7\
#     --arm_size ${arm_size}\
#     > log/${ex}_${dataset_name}-2024-07-28.log 2>&1 &

################ ETA 13:30

# dataset_name='Amazon_Arts'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=10
# arm_size=3
# epoch=100
# ppo_model_name="run_ppo_rt_0.9_bs_128_${arm_size}_arm_0_iter_${iter_i}_train_model_epoch_${epoch}.pth"
# refl_ver=3
# ex="PPO_v1_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}_a_${arm_size}_ep_${epoch}" # remember to change
# CUDA_VISIBLE_DEVICES=5  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 0\
#     --gpu_memory_utilization 0.3\
#     --arm_size ${arm_size}\
#     > log/${ex}_${dataset_name}-2024-07-29.log 2>&1 &

# dataset_name='Amazon_Games'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=10
# arm_size=3
# epoch=100
# ppo_model_name="run_ppo_rt_0.9_bs_128_${arm_size}_arm_0_iter_${iter_i}_train_model_epoch_${epoch}.pth"
# refl_ver=3
# ex="PPO_v1_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}_a_${arm_size}_ep_${epoch}" # remember to change
# CUDA_VISIBLE_DEVICES=5  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 15\
#     --gpu_memory_utilization 0.3\
#     --arm_size ${arm_size}\
#     > log/${ex}_${dataset_name}-2024-07-29.log 2>&1 &

# dataset_name='Amazon_Instruments'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=10
# arm_size=3
# epoch=100
# ppo_model_name="run_ppo_rt_0.9_bs_128_${arm_size}_arm_0_iter_${iter_i}_train_model_epoch_${epoch}.pth"
# refl_ver=3
# ex="PPO_v1_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}_a_${arm_size}_ep_${epoch}" # remember to change
# CUDA_VISIBLE_DEVICES=5  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 32\
#     --gpu_memory_utilization 0.3\
#     --arm_size ${arm_size}\
#     > log/${ex}_${dataset_name}-2024-07-29.log 2>&1 &

#####################

# dataset_name='Amazon_Instruments'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=7
# arm_size=3
# epoch=100
# ppo_model_name="run_ppo_rt_0.9_bs_128_${arm_size}_arm_0_iter_10_train_model_epoch_${epoch}.pth"
# refl_ver=3
# ex="PPO_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}_a_${arm_size}_ep_${epoch}" # remember to change
# CUDA_VISIBLE_DEVICES=5  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 25\
#     --gpu_memory_utilization 0.3\
#     --arm_size ${arm_size}\
#     > log/${ex}_${dataset_name}-2024-07-28.log 2>&1 &

# dataset_name='Amazon_Arts'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=7
# arm_size=3
# epoch=100
# ppo_model_name="run_ppo_rt_0.9_bs_128_${arm_size}_arm_0_iter_10_train_model_epoch_${epoch}.pth"
# refl_ver=3
# ex="PPO_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}_a_${arm_size}_ep_${epoch}" # remember to change
# CUDA_VISIBLE_DEVICES=5  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 40\
#     --gpu_memory_utilization 0.3\
#     --arm_size ${arm_size}\
#     > log/${ex}_${dataset_name}-2024-07-28.log 2>&1 &

# dataset_name='Amazon_Arts'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=7
# arm_size=3
# epoch=100
# ppo_model_name="run_ppo_rt_0.9_bs_128_${arm_size}_arm_0_iter_10_train_model_epoch_${epoch}.pth"
# refl_ver=3
# ex="PPO_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}_a_${arm_size}_ep_${epoch}" # remember to change
# CUDA_VISIBLE_DEVICES=5  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 55\
#     --gpu_memory_utilization 0.3\
#     --arm_size ${arm_size}\
#     > log/${ex}_${dataset_name}-2024-07-28.log 2>&1 &

############## GREEDY SELECTION

# dataset_name='Amazon_Games'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=7
# ppo_model_name="run_ppo_train_model_epoch_100.pth"
# refl_ver=3
# ex="Greedy_select_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}" # remember to change
# CUDA_VISIBLE_DEVICES=7  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 0\
#     --greedy_selection \
#     --gpu_memory_utilization 0.9\
#     > log/${ex}_${dataset_name}-2024-07-29.log 2>&1 &

# dataset_name='Amazon_Arts'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=10
# ppo_model_name="run_ppo_train_model_epoch_100.pth"
# refl_ver=3
# ex="Greedy_select_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}" # remember to change
# CUDA_VISIBLE_DEVICES=7  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 15\
#     --greedy_selection \
#     --gpu_memory_utilization 0.9\
#     > log/${ex}_${dataset_name}-2024-07-29.log 2>&1 &

# dataset_name='Amazon_Instruments'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=7
# ppo_model_name="run_ppo_train_model_epoch_100.pth"
# refl_ver=3
# ex="Greedy_select_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}" # remember to change
# CUDA_VISIBLE_DEVICES=7  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 15\
#     --greedy_selection \
#     --gpu_memory_utilization 0.9\
#     > log/${ex}_${dataset_name}-2024-07-29.log 2>&1 &

################# ALL TYPES

# dataset_name='Amazon_Games'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=10
# ppo_model_name="run_ppo_train_model_epoch_100.pth"
# refl_ver=3
# ex="All_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}" # remember to change
# CUDA_VISIBLE_DEVICES=7  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 52\
#     --all_types \
#     --gpu_memory_utilization 0.9\
#     > log/${ex}_${dataset_name}-2024-07-29.log 2>&1 &

# dataset_name='Amazon_Arts'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=10
# ppo_model_name="run_ppo_train_model_epoch_100.pth"
# refl_ver=3
# ex="All_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}" # remember to change
# CUDA_VISIBLE_DEVICES=7  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 68\
#     --all_types \
#     --gpu_memory_utilization 0.9\
#     > log/${ex}_${dataset_name}-2024-07-29.log 2>&1 &

# dataset_name='Amazon_Instruments'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=10
# ppo_model_name="run_ppo_train_model_epoch_100.pth"
# refl_ver=3
# ex="All_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}" # remember to change
# CUDA_VISIBLE_DEVICES=7  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 87\
#     --all_types \
#     --gpu_memory_utilization 0.9\
#     > log/${ex}_${dataset_name}-2024-07-29.log 2>&1 &

################ 07291008 executed:

# dataset_name='Amazon_Games'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=7
# ppo_model_name="run_ppo_train_model_epoch_100.pth"
# refl_ver=3
# ex="Greedy_select_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}" # remember to change
# CUDA_VISIBLE_DEVICES=7  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 0\
#     --greedy_selection \
#     --gpu_memory_utilization 0.9\
#     > log/${ex}_${dataset_name}-2024-07-29.log 2>&1 &

# dataset_name='Amazon_Instruments'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=7
# ppo_model_name="run_ppo_train_model_epoch_100.pth"
# refl_ver=3
# ex="Greedy_select_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}" # remember to change
# CUDA_VISIBLE_DEVICES=7  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 15\
#     --greedy_selection \
#     --gpu_memory_utilization 0.9\
#     > log/${ex}_${dataset_name}-2024-07-29.log 2>&1 &

################ PPO select v2

# dataset_name='Amazon_Instruments'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=12
# arm_size=3
# epoch=100
# ppo_model_name="run_ppo_rt_0.9_bs_128_${arm_size}_arm_0_iter_10_train_model_epoch_${epoch}.pth"
# refl_ver=3
# ex="PPO_v1_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}_a_${arm_size}_ep_${epoch}" # remember to change
# CUDA_VISIBLE_DEVICES=5  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 0\
#     --gpu_memory_utilization 0.28\
#     --arm_size ${arm_size}\
#     > log/${ex}_${dataset_name}-2024-07-29.log 2>&1 &

################# TITLE ATTRIBUTE only

# dataset_name='Amazon_Games'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=10
# ppo_model_name="run_ppo_train_model_epoch_100.pth"
# refl_ver=3
# ex="TA_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}" # remember to change
# CUDA_VISIBLE_DEVICES=7  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 32\
#     --EP_IP_only \
#     --gpu_memory_utilization 0.9\
#     > log/${ex}_${dataset_name}-2024-07-29.log 2>&1 &

# dataset_name='Amazon_Arts'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=10
# ppo_model_name="run_ppo_train_model_epoch_100.pth"
# refl_ver=3
# ex="TA_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}" # remember to change
# CUDA_VISIBLE_DEVICES=7  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 47\
#     --EP_IP_only \
#     --gpu_memory_utilization 0.9\
#     > log/${ex}_${dataset_name}-2024-07-29.log 2>&1 &

# dataset_name='Amazon_Instruments'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=10
# ppo_model_name="run_ppo_train_model_epoch_100.pth"
# refl_ver=3
# ex="TA_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}" # remember to change
# CUDA_VISIBLE_DEVICES=7  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 64\
#     --EP_IP_only \
#     --gpu_memory_utilization 0.9\
#     > log/${ex}_${dataset_name}-2024-07-29.log 2>&1 &

################# TITLE CF only

# dataset_name='Amazon_Games'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=10
# ppo_model_name="run_ppo_train_model_epoch_100.pth"
# refl_ver=3
# ex="TC_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}" # remember to change
# CUDA_VISIBLE_DEVICES=5  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 20\
#     --EP_CF_only \
#     --gpu_memory_utilization 0.3\
#     > log/${ex}_${dataset_name}-2024-07-29.log 2>&1 &

# dataset_name='Amazon_Arts'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=10
# ppo_model_name="run_ppo_train_model_epoch_100.pth"
# refl_ver=3
# ex="TC_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}" # remember to change
# CUDA_VISIBLE_DEVICES=5  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 40\
#     --EP_CF_only \
#     --gpu_memory_utilization 0.3\
#     > log/${ex}_${dataset_name}-2024-07-29.log 2>&1 &

# dataset_name='Amazon_Instruments'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=10
# ppo_model_name="run_ppo_train_model_epoch_100.pth"
# refl_ver=3
# ex="TC_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}" # remember to change
# CUDA_VISIBLE_DEVICES=5  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 60\
#     --EP_CF_only \
#     --gpu_memory_utilization 0.28\
#     > log/${ex}_${dataset_name}-2024-07-29.log 2>&1 &

################# CF ATTRIBUTE only

# dataset_name='Amazon_Games'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=10
# ppo_model_name="run_ppo_train_model_epoch_100.pth"
# refl_ver=3
# ex="CA_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}" # remember to change
# CUDA_VISIBLE_DEVICES=7  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 84\
#     --CF_IP_only \
#     --gpu_memory_utilization 0.9\
#     > log/${ex}_${dataset_name}-2024-07-29.log 2>&1 &

# dataset_name='Amazon_Arts'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=10
# ppo_model_name="run_ppo_train_model_epoch_100.pth"
# refl_ver=3
# ex="CA_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}" # remember to change
# CUDA_VISIBLE_DEVICES=7  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 99\
#     --CF_IP_only \
#     --gpu_memory_utilization 0.9\
#     > log/${ex}_${dataset_name}-2024-07-29.log 2>&1 &

# dataset_name='Amazon_Instruments'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=10
# ppo_model_name="run_ppo_train_model_epoch_100.pth"
# refl_ver=3
# ex="CA_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}" # remember to change
# CUDA_VISIBLE_DEVICES=7  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 116\
#     --CF_IP_only \
#     --gpu_memory_utilization 0.9\
#     > log/${ex}_${dataset_name}-2024-07-29.log 2>&1 &

########################### 20240729v2 RANDOM SELECTION

# dataset_name='Amazon_Games'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=10
# ppo_model_name="run_ppo_train_model_epoch_100.pth"
# refl_ver=3
# ex="RS_v1_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}" # remember to change
# CUDA_VISIBLE_DEVICES=4  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 0\
#     --random_selection \
#     --gpu_memory_utilization 0.9\
#     > log/${ex}_${dataset_name}-2024-07-29.log 2>&1 &

# dataset_name='Amazon_Arts'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=10
# ppo_model_name="run_ppo_train_model_epoch_100.pth"
# refl_ver=3
# ex="RS_v1_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}" # remember to change
# CUDA_VISIBLE_DEVICES=4  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 15\
#     --random_selection \
#     --gpu_memory_utilization 0.9\
#     > log/${ex}_${dataset_name}-2024-07-29.log 2>&1 &

# dataset_name='Amazon_Instruments'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=10
# ppo_model_name="run_ppo_train_model_epoch_100.pth"
# refl_ver=3
# ex="RS_v1_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}" # remember to change
# CUDA_VISIBLE_DEVICES=4  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 33\
#     --random_selection \
#     --gpu_memory_utilization 0.9\
#     > log/${ex}_${dataset_name}-2024-07-29.log 2>&1 &

################## PPO select v3
# dataset_name='Amazon_Games'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=12
# arm_size=3
# epoch=100
# ppo_model_name="run_ppo_rt_0.9_bs_128_${arm_size}_arm_0_iter_10_train_model_epoch_${epoch}.pth"
# refl_ver=3
# ex="PPO_v2_1_${baseline_name}_vllm_nds_ne_t0.2_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}_a_${arm_size}_ep_${epoch}" # remember to change
# CUDA_VISIBLE_DEVICES=7  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 1\
#     --temperature 0.2\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 0\
#     --gpu_memory_utilization 0.95\
#     --arm_size ${arm_size}\
#     > log/${ex}_${dataset_name}-2024-07-29.log 2>&1 &

# dataset_name='Amazon_Games'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=12
# arm_size=3
# epoch=100
# ppo_model_name="run_ppo_rt_0.9_bs_128_${arm_size}_arm_0_iter_10_train_model_epoch_${epoch}.pth"
# refl_ver=3
# ex="PPO_v2_1_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}_a_${arm_size}_ep_${epoch}" # remember to change
# CUDA_VISIBLE_DEVICES=4  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 11\
#     --gpu_memory_utilization 0.9\
#     --arm_size ${arm_size}\
#     > log/${ex}_${dataset_name}-2024-07-29.log 2>&1 &

################## 0730

# dataset_name='Amazon_Arts'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=10
# arm_size=3
# epoch=100
# ppo_model_name="run_ppo_rt_0.9_bs_128_${arm_size}_arm_0_iter_10_train_model_epoch_${epoch}.pth"
# refl_ver=3
# ex="PPO_v2_1_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}_a_${arm_size}_ep_${epoch}" # remember to change
# CUDA_VISIBLE_DEVICES=5  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 0\
#     --gpu_memory_utilization 0.28\
#     --arm_size ${arm_size}\
#     > log/${ex}_${dataset_name}-2024-07-29.log 2>&1 &

# dataset_name='Amazon_Arts'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=10
# arm_size=3
# epoch=100
# ppo_model_name="run_ppo_rt_0.9_bs_128_${arm_size}_arm_0_iter_10_train_model_epoch_${epoch}.pth"
# refl_ver=3
# ex="PPO_v1_1_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}_a_${arm_size}_ep_${epoch}" # remember to change
# CUDA_VISIBLE_DEVICES=5  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 16\
#     --gpu_memory_utilization 0.28\
#     --arm_size ${arm_size}\
#     > log/${ex}_${dataset_name}-2024-07-29.log 2>&1 &

################# 0730 v2

# dataset_name='Amazon_Instruments'
# baseline_name='MoRE_w_reflect'
# EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
# CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
# IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
# iter_i=13
# arm_size=3
# epoch=100
# ppo_model_name="run_ppo_rt_0.9_bs_128_${arm_size}_arm_0_iter_10_train_model_epoch_${epoch}.pth"
# refl_ver=3
# ex="PPO_v2_1_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}_a_${arm_size}_ep_${epoch}" # remember to change
# CUDA_VISIBLE_DEVICES=5  \
# nohup  python -u refl_re_recommend.py  \
#     -dn $dataset_name -ex $ex \
#     -bs 12 \
#     --vllm \
#     --do_sample 0\
#     --num_prompt \
#     --baseline_name $baseline_name \
#     --inters_num_prompt \
#     --candidate_set_set_prompt \
#     --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
#     --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
#     --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
#     --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
#     --iter_i ${iter_i}\
#     --MoRE_w_reflect_version ${refl_ver}\
#     --waiting_min 0\
#     --gpu_memory_utilization 0.28\
#     --arm_size ${arm_size}\
#     > log/${ex}_${dataset_name}-2024-07-29.log 2>&1 &

dataset_name='Amazon_Instruments'
baseline_name='MoRE_w_reflect'
EP_reflect_name='EP_B1_maxFM_cluster_user_first_t1.0_te_new'
CF_reflect_name='CF_B1_maxFM_cluster_t1.0_te_new'
IP_reflect_name='IP_B1_maxFM_cluster_t1.0_te_new'
iter_i=13
arm_size=3
epoch=100
ppo_model_name="run_ppo_rt_0.9_bs_128_${arm_size}_arm_0_iter_10_train_model_epoch_${epoch}.pth"
refl_ver=3
ex="PPO_v1_1_${baseline_name}_vllm_nds_ne_greedy_np_inp_cssp_all_rv_${refl_ver}_iter_${iter_i}_a_${arm_size}_ep_${epoch}" # remember to change
CUDA_VISIBLE_DEVICES=5  \
nohup  python -u refl_re_recommend.py  \
    -dn $dataset_name -ex $ex \
    -bs 12 \
    --vllm \
    --do_sample 0\
    --num_prompt \
    --baseline_name $baseline_name \
    --inters_num_prompt \
    --candidate_set_set_prompt \
    --ppo_model_path /data1/CoAuthor1/Py_projects/MoRE/rl_select/Meta-Reflect/${dataset_name}_${ppo_model_name} \
    --CF_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${CF_reflect_name} \
    --IP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${IP_reflect_name} \
    --EP_refl_path /data1/CoAuthor1/Py_projects/MoRE/iter_pool/${dataset_name}_${EP_reflect_name} \
    --iter_i ${iter_i}\
    --MoRE_w_reflect_version ${refl_ver}\
    --waiting_min 0\
    --gpu_memory_utilization 0.28\
    --arm_size ${arm_size}\
    > log/${ex}_${dataset_name}-2024-07-29.log 2>&1 &
