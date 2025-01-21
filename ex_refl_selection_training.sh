#     parser.add_argument("--savedir", type=str, default='train_model', help="name-saved-model")
    
    # parser.add_argument("-sd", "--state_dim", type=int, default=128, help="state's dimension")
    # parser.add_argument("-gi", "--gpu_id", type=str, default='3', help="gpu id setup")
    # parser.add_argument("-rad", "--reflect_act_dim", type=int, default=3, help="reflect action dimension")
    # parser.add_argument("-dn", "--dataset_name", type=str, default='Amazon_Arts', help="dataset name")
    # parser.add_argument("-in", "--iter_num", type=int, default=14, help="reflect iteration number")
    # parser.add_argument("-vsp", "--valid_sample_path", type=str, default='prepare_cluster_user/dataset/Amazon_Arts/new_valid_samples.json', help="valid sample path")
    # parser.add_argument("-vbnp", "--valid_base_ndcg_path", type=str, default='iter_pool/Amazon_Arts_title_B1_maxFM_cluster_user_first_t1.0_te_new', help="valid base ndcg path")
    # parser.add_argument("-crp", "--CF_refl_path", type=str, default='iter_pool/Amazon_Arts_CF_B1_maxFM_cluster_t1.0_te_new', help="CF reflect info dict")
    # parser.add_argument("-erp", "--EP_refl_path", type=str, default='iter_pool/Amazon_Arts_title_B1_maxFM_cluster_user_first_t1.0_te_new', help="title reflect info dict")
    # parser.add_argument("-irp", "--IP_refl_path", type=str, default='iter_pool/Amazon_Arts_attr_B1_maxFM_cluster_t1.0_te_new', help="attr reflect info dict")

# dataset_name="Amazon_Arts"
# iter_num=14
# # CUDA_VISIBLE_DEVICES=5
# gpu_id=5
# valid_sample_path="prepare_cluster_user/dataset/${dataset_name}/new_valid_samples.json"
# valid_base_ndcg_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# CF_refl_path="iter_pool/${dataset_name}_CF_B1_maxFM_cluster_t1.0_te_new"
# EP_refl_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# IP_refl_path="iter_pool/${dataset_name}_attr_B1_maxFM_cluster_t1.0_te_new"
# ex="run_ppo"
# nohup python refl_selection_training.py -dn ${dataset_name} \
#     -in ${iter_num} \
#     -vsp ${valid_sample_path} \
#     -vbnp ${valid_base_ndcg_path} \
#     -crp ${CF_refl_path} \
#     -erp ${EP_refl_path} \
#     -irp ${IP_refl_path} \
#     -gi ${gpu_id} \
#     --savedir ${dataset_name}_${ex}_train_model \
#     > rl_select/logs/${dataset_name}_${ex}-20240727.log 2>&1 &

# dataset_name="Amazon_Games"
# iter_num=14
# # CUDA_VISIBLE_DEVICES=5
# gpu_id=5
# valid_sample_path="prepare_cluster_user/dataset/${dataset_name}/new_valid_samples.json"
# valid_base_ndcg_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# CF_refl_path="iter_pool/${dataset_name}_CF_B1_maxFM_cluster_t1.0_te_new"
# EP_refl_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# IP_refl_path="iter_pool/${dataset_name}_attr_B1_maxFM_cluster_t1.0_te_new"
# ex="run_ppo"
# nohup python refl_selection_training.py -dn ${dataset_name} \
#     -in ${iter_num} \
#     -vsp ${valid_sample_path} \
#     -vbnp ${valid_base_ndcg_path} \
#     -crp ${CF_refl_path} \
#     -erp ${EP_refl_path} \
#     -irp ${IP_refl_path} \
#     -gi ${gpu_id} \
#     --savedir ${dataset_name}_${ex}_train_model \
#     > rl_select/logs/${dataset_name}_${ex}-20240727.log 2>&1 &

# dataset_name="Amazon_Instruments"
# iter_num=14
# # CUDA_VISIBLE_DEVICES=4
# gpu_id=4
# valid_sample_path="prepare_cluster_user/dataset/${dataset_name}/new_valid_samples.json"
# valid_base_ndcg_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# CF_refl_path="iter_pool/${dataset_name}_CF_B1_maxFM_cluster_t1.0_te_new"
# EP_refl_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# IP_refl_path="iter_pool/${dataset_name}_attr_B1_maxFM_cluster_t1.0_te_new"
# ex="run_ppo"
# nohup python refl_selection_training.py -dn ${dataset_name} \
#     -in ${iter_num} \
#     -vsp ${valid_sample_path} \
#     -vbnp ${valid_base_ndcg_path} \
#     -crp ${CF_refl_path} \
#     -erp ${EP_refl_path} \
#     -irp ${IP_refl_path} \
#     -gi ${gpu_id} \
#     --savedir ${dataset_name}_${ex}_train_model \
#     > rl_select/logs/${dataset_name}_${ex}-20240727.log 2>&1 &

##############################

# dataset_name="Amazon_Arts"
# iter_num=14
# # CUDA_VISIBLE_DEVICES=5
# gpu_id=5
# random_thresh=0.8
# batch_size=128
# valid_sample_path="prepare_cluster_user/dataset/${dataset_name}/new_valid_samples.json"
# valid_base_ndcg_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# CF_refl_path="iter_pool/${dataset_name}_CF_B1_maxFM_cluster_t1.0_te_new"
# EP_refl_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# IP_refl_path="iter_pool/${dataset_name}_attr_B1_maxFM_cluster_t1.0_te_new"
# ex="run_ppo_rt_${random_thresh}_bs_${batch_size}"
# nohup python refl_selection_training.py -dn ${dataset_name} \
#     -in ${iter_num} \
#     -vsp ${valid_sample_path} \
#     -vbnp ${valid_base_ndcg_path} \
#     -crp ${CF_refl_path} \
#     -erp ${EP_refl_path} \
#     -irp ${IP_refl_path} \
#     -gi ${gpu_id} \
#     -bs ${batch_size} \
#     -mbs ${batch_size}\
#     --savedir ${dataset_name}_${ex}_train_model \
#     -rt ${random_thresh}\
#     > rl_select/logs/${dataset_name}_${ex}-20240727.log 2>&1 &

# dataset_name="Amazon_Games"
# iter_num=14
# # CUDA_VISIBLE_DEVICES=5
# gpu_id=5
# random_thresh=0.8
# batch_size=128
# valid_sample_path="prepare_cluster_user/dataset/${dataset_name}/new_valid_samples.json"
# valid_base_ndcg_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# CF_refl_path="iter_pool/${dataset_name}_CF_B1_maxFM_cluster_t1.0_te_new"
# EP_refl_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# IP_refl_path="iter_pool/${dataset_name}_attr_B1_maxFM_cluster_t1.0_te_new"
# ex="run_ppo_rt_${random_thresh}_bs_${batch_size}"
# nohup python refl_selection_training.py -dn ${dataset_name} \
#     -in ${iter_num} \
#     -vsp ${valid_sample_path} \
#     -vbnp ${valid_base_ndcg_path} \
#     -crp ${CF_refl_path} \
#     -erp ${EP_refl_path} \
#     -irp ${IP_refl_path} \
#     -gi ${gpu_id} \
#     -bs ${batch_size} \
#     -mbs ${batch_size}\
#     --savedir ${dataset_name}_${ex}_train_model \
#     -rt ${random_thresh}\
#     > rl_select/logs/${dataset_name}_${ex}-20240727.log 2>&1 &

# dataset_name="Amazon_Instruments"
# iter_num=14
# # CUDA_VISIBLE_DEVICES=4
# gpu_id=4
# random_thresh=0.8
# batch_size=128
# valid_sample_path="prepare_cluster_user/dataset/${dataset_name}/new_valid_samples.json"
# valid_base_ndcg_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# CF_refl_path="iter_pool/${dataset_name}_CF_B1_maxFM_cluster_t1.0_te_new"
# EP_refl_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# IP_refl_path="iter_pool/${dataset_name}_attr_B1_maxFM_cluster_t1.0_te_new"
# ex="run_ppo_rt_${random_thresh}_bs_${batch_size}"
# nohup python refl_selection_training.py -dn ${dataset_name} \
#     -in ${iter_num} \
#     -vsp ${valid_sample_path} \
#     -vbnp ${valid_base_ndcg_path} \
#     -crp ${CF_refl_path} \
#     -erp ${EP_refl_path} \
#     -irp ${IP_refl_path} \
#     -gi ${gpu_id} \
#     -bs ${batch_size} \
#     -mbs ${batch_size}\
#     --savedir ${dataset_name}_${ex}_train_model \
#     -rt ${random_thresh}\
#     > rl_select/logs/${dataset_name}_${ex}-20240727.log 2>&1 &

##################################

# dataset_name="Amazon_Arts"
# iter_num=14
# # CUDA_VISIBLE_DEVICES=5
# gpu_id=5
# random_thresh=0.9
# batch_size=128
# valid_sample_path="prepare_cluster_user/dataset/${dataset_name}/new_valid_samples.json"
# valid_base_ndcg_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# CF_refl_path="iter_pool/${dataset_name}_CF_B1_maxFM_cluster_t1.0_te_new"
# EP_refl_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# IP_refl_path="iter_pool/${dataset_name}_attr_B1_maxFM_cluster_t1.0_te_new"
# ex="run_ppo_rt_${random_thresh}_bs_${batch_size}"
# nohup python refl_selection_training.py -dn ${dataset_name} \
#     -in ${iter_num} \
#     -vsp ${valid_sample_path} \
#     -vbnp ${valid_base_ndcg_path} \
#     -crp ${CF_refl_path} \
#     -erp ${EP_refl_path} \
#     -irp ${IP_refl_path} \
#     -gi ${gpu_id} \
#     -bs ${batch_size} \
#     -mbs ${batch_size}\
#     --savedir ${dataset_name}_${ex}_train_model \
#     -rt ${random_thresh}\
#     > rl_select/logs/${dataset_name}_${ex}-20240727.log 2>&1 &

# dataset_name="Amazon_Games"
# iter_num=14
# # CUDA_VISIBLE_DEVICES=5
# gpu_id=5
# random_thresh=0.9
# batch_size=128
# valid_sample_path="prepare_cluster_user/dataset/${dataset_name}/new_valid_samples.json"
# valid_base_ndcg_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# CF_refl_path="iter_pool/${dataset_name}_CF_B1_maxFM_cluster_t1.0_te_new"
# EP_refl_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# IP_refl_path="iter_pool/${dataset_name}_attr_B1_maxFM_cluster_t1.0_te_new"
# ex="run_ppo_rt_${random_thresh}_bs_${batch_size}"
# nohup python refl_selection_training.py -dn ${dataset_name} \
#     -in ${iter_num} \
#     -vsp ${valid_sample_path} \
#     -vbnp ${valid_base_ndcg_path} \
#     -crp ${CF_refl_path} \
#     -erp ${EP_refl_path} \
#     -irp ${IP_refl_path} \
#     -gi ${gpu_id} \
#     -bs ${batch_size} \
#     -mbs ${batch_size}\
#     --savedir ${dataset_name}_${ex}_train_model \
#     -rt ${random_thresh}\
#     > rl_select/logs/${dataset_name}_${ex}-20240727.log 2>&1 &

# dataset_name="Amazon_Instruments"
# iter_num=14
# # CUDA_VISIBLE_DEVICES=4
# gpu_id=4
# random_thresh=0.9
# batch_size=128
# valid_sample_path="prepare_cluster_user/dataset/${dataset_name}/new_valid_samples.json"
# valid_base_ndcg_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# CF_refl_path="iter_pool/${dataset_name}_CF_B1_maxFM_cluster_t1.0_te_new"
# EP_refl_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# IP_refl_path="iter_pool/${dataset_name}_attr_B1_maxFM_cluster_t1.0_te_new"
# ex="run_ppo_rt_${random_thresh}_bs_${batch_size}"
# nohup python refl_selection_training.py -dn ${dataset_name} \
#     -in ${iter_num} \
#     -vsp ${valid_sample_path} \
#     -vbnp ${valid_base_ndcg_path} \
#     -crp ${CF_refl_path} \
#     -erp ${EP_refl_path} \
#     -irp ${IP_refl_path} \
#     -gi ${gpu_id} \
#     -bs ${batch_size} \
#     -mbs ${batch_size}\
#     --savedir ${dataset_name}_${ex}_train_model \
#     -rt ${random_thresh}\
#     > rl_select/logs/${dataset_name}_${ex}-20240727.log 2>&1 &

############################

# dataset_name="Amazon_Arts"
# iter_num=14
# # CUDA_VISIBLE_DEVICES=5
# gpu_id=5
# random_thresh=0.9
# batch_size=128
# valid_sample_path="prepare_cluster_user/dataset/${dataset_name}/new_valid_samples.json"
# valid_base_ndcg_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# CF_refl_path="iter_pool/${dataset_name}_CF_B1_maxFM_cluster_t1.0_te_new"
# EP_refl_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# IP_refl_path="iter_pool/${dataset_name}_attr_B1_maxFM_cluster_t1.0_te_new"
# ex="run_ppo_rt_${random_thresh}_bs_${batch_size}_4_arm_0"
# nohup python refl_selection_training.py -dn ${dataset_name} \
#     -in ${iter_num} \
#     -vsp ${valid_sample_path} \
#     -vbnp ${valid_base_ndcg_path} \
#     -crp ${CF_refl_path} \
#     -erp ${EP_refl_path} \
#     -irp ${IP_refl_path} \
#     -gi ${gpu_id} \
#     -bs ${batch_size} \
#     -mbs ${batch_size}\
#     --savedir ${dataset_name}_${ex}_train_model \
#     -rt ${random_thresh}\
#     > rl_select/logs/${dataset_name}_${ex}-20240727.log 2>&1 &

# dataset_name="Amazon_Games"
# iter_num=14
# # CUDA_VISIBLE_DEVICES=5
# gpu_id=5
# random_thresh=0.9
# batch_size=128
# valid_sample_path="prepare_cluster_user/dataset/${dataset_name}/new_valid_samples.json"
# valid_base_ndcg_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# CF_refl_path="iter_pool/${dataset_name}_CF_B1_maxFM_cluster_t1.0_te_new"
# EP_refl_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# IP_refl_path="iter_pool/${dataset_name}_attr_B1_maxFM_cluster_t1.0_te_new"
# ex="run_ppo_rt_${random_thresh}_bs_${batch_size}_4_arm_0"
# nohup python refl_selection_training.py -dn ${dataset_name} \
#     -in ${iter_num} \
#     -vsp ${valid_sample_path} \
#     -vbnp ${valid_base_ndcg_path} \
#     -crp ${CF_refl_path} \
#     -erp ${EP_refl_path} \
#     -irp ${IP_refl_path} \
#     -gi ${gpu_id} \
#     -bs ${batch_size} \
#     -mbs ${batch_size}\
#     --savedir ${dataset_name}_${ex}_train_model \
#     -rt ${random_thresh}\
#     > rl_select/logs/${dataset_name}_${ex}-20240727.log 2>&1 &

# dataset_name="Amazon_Instruments"
# iter_num=14
# # CUDA_VISIBLE_DEVICES=4
# gpu_id=4
# random_thresh=0.9
# batch_size=128
# valid_sample_path="prepare_cluster_user/dataset/${dataset_name}/new_valid_samples.json"
# valid_base_ndcg_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# CF_refl_path="iter_pool/${dataset_name}_CF_B1_maxFM_cluster_t1.0_te_new"
# EP_refl_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# IP_refl_path="iter_pool/${dataset_name}_attr_B1_maxFM_cluster_t1.0_te_new"
# ex="run_ppo_rt_${random_thresh}_bs_${batch_size}_4_arm_0"
# nohup python refl_selection_training.py -dn ${dataset_name} \
#     -in ${iter_num} \
#     -vsp ${valid_sample_path} \
#     -vbnp ${valid_base_ndcg_path} \
#     -crp ${CF_refl_path} \
#     -erp ${EP_refl_path} \
#     -irp ${IP_refl_path} \
#     -gi ${gpu_id} \
#     -bs ${batch_size} \
#     -mbs ${batch_size}\
#     --savedir ${dataset_name}_${ex}_train_model \
#     -rt ${random_thresh}\
#     > rl_select/logs/${dataset_name}_${ex}-20240727.log 2>&1 &

###############################

# dataset_name="Amazon_Arts"
# iter_num=14
# # CUDA_VISIBLE_DEVICES=5
# gpu_id=5
# random_thresh=0.9
# batch_size=128
# reflect_act_dim=3
# valid_sample_path="prepare_cluster_user/dataset/${dataset_name}/new_valid_samples.json"
# valid_base_ndcg_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# CF_refl_path="iter_pool/${dataset_name}_CF_B1_maxFM_cluster_t1.0_te_new"
# EP_refl_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# IP_refl_path="iter_pool/${dataset_name}_attr_B1_maxFM_cluster_t1.0_te_new"
# ex="run_ppo_rt_${random_thresh}_bs_${batch_size}_${reflect_act_dim}_arm_0"
# nohup python refl_selection_training.py -dn ${dataset_name} \
#     -in ${iter_num} \
#     -vsp ${valid_sample_path} \
#     -vbnp ${valid_base_ndcg_path} \
#     -crp ${CF_refl_path} \
#     -erp ${EP_refl_path} \
#     -irp ${IP_refl_path} \
#     -gi ${gpu_id} \
#     -bs ${batch_size} \
#     -mbs ${batch_size}\
#     -rad ${reflect_act_dim} \
#     --savedir ${dataset_name}_${ex}_train_model \
#     -rt ${random_thresh}\
#     > rl_select/logs/${dataset_name}_${ex}-20240727.log 2>&1 &

# dataset_name="Amazon_Games"
# iter_num=14
# # CUDA_VISIBLE_DEVICES=5
# gpu_id=5
# random_thresh=0.9
# batch_size=128
# reflect_act_dim=3
# valid_sample_path="prepare_cluster_user/dataset/${dataset_name}/new_valid_samples.json"
# valid_base_ndcg_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# CF_refl_path="iter_pool/${dataset_name}_CF_B1_maxFM_cluster_t1.0_te_new"
# EP_refl_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# IP_refl_path="iter_pool/${dataset_name}_attr_B1_maxFM_cluster_t1.0_te_new"
# ex="run_ppo_rt_${random_thresh}_bs_${batch_size}_${reflect_act_dim}_arm_0_iter_${iter_num}"
# nohup python refl_selection_training.py -dn ${dataset_name} \
#     -in ${iter_num} \
#     -vsp ${valid_sample_path} \
#     -vbnp ${valid_base_ndcg_path} \
#     -crp ${CF_refl_path} \
#     -erp ${EP_refl_path} \
#     -irp ${IP_refl_path} \
#     -gi ${gpu_id} \
#     -bs ${batch_size} \
#     -mbs ${batch_size}\
#     -rad ${reflect_act_dim}\
#     --savedir ${dataset_name}_${ex}_train_model \
#     -rt ${random_thresh}\
#     > rl_select/logs/${dataset_name}_${ex}-20240727.log 2>&1 &

# dataset_name="Amazon_Instruments"
# iter_num=14
# # CUDA_VISIBLE_DEVICES=4
# gpu_id=4
# random_thresh=0.9
# batch_size=128
# reflect_act_dim=3
# valid_sample_path="prepare_cluster_user/dataset/${dataset_name}/new_valid_samples.json"
# valid_base_ndcg_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# CF_refl_path="iter_pool/${dataset_name}_CF_B1_maxFM_cluster_t1.0_te_new"
# EP_refl_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# IP_refl_path="iter_pool/${dataset_name}_attr_B1_maxFM_cluster_t1.0_te_new"
# ex="run_ppo_rt_${random_thresh}_bs_${batch_size}_${reflect_act_dim}_arm_0"
# nohup python refl_selection_training.py -dn ${dataset_name} \
#     -in ${iter_num} \
#     -vsp ${valid_sample_path} \
#     -vbnp ${valid_base_ndcg_path} \
#     -crp ${CF_refl_path} \
#     -erp ${EP_refl_path} \
#     -irp ${IP_refl_path} \
#     -gi ${gpu_id} \
#     -bs ${batch_size} \
#     -mbs ${batch_size}\
#     -rad ${reflect_act_dim} \
#     --savedir ${dataset_name}_${ex}_train_model \
#     -rt ${random_thresh}\
#     > rl_select/logs/${dataset_name}_${ex}-20240727.log 2>&1 &

# dataset_name="Amazon_Arts"
# iter_num=10
# # CUDA_VISIBLE_DEVICES=5
# gpu_id=5
# random_thresh=0.9
# batch_size=128
# reflect_act_dim=3
# valid_sample_path="prepare_cluster_user/dataset/${dataset_name}/new_valid_samples.json"
# valid_base_ndcg_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# CF_refl_path="iter_pool/${dataset_name}_CF_B1_maxFM_cluster_t1.0_te_new"
# EP_refl_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# IP_refl_path="iter_pool/${dataset_name}_attr_B1_maxFM_cluster_t1.0_te_new"
# ex="run_ppo_rt_${random_thresh}_bs_${batch_size}_${reflect_act_dim}_arm_0_iter_${iter_num}"
# nohup python refl_selection_training.py -dn ${dataset_name} \
#     -in ${iter_num} \
#     -vsp ${valid_sample_path} \
#     -vbnp ${valid_base_ndcg_path} \
#     -crp ${CF_refl_path} \
#     -erp ${EP_refl_path} \
#     -irp ${IP_refl_path} \
#     -gi ${gpu_id} \
#     -bs ${batch_size} \
#     -mbs ${batch_size}\
#     -rad ${reflect_act_dim} \
#     --savedir ${dataset_name}_${ex}_train_model \
#     -rt ${random_thresh}\
#     > rl_select/logs/${dataset_name}_${ex}-20240728.log 2>&1 &

# dataset_name="Amazon_Games"
# iter_num=10
# # CUDA_VISIBLE_DEVICES=5
# gpu_id=5
# random_thresh=0.9
# batch_size=128
# reflect_act_dim=3
# valid_sample_path="prepare_cluster_user/dataset/${dataset_name}/new_valid_samples.json"
# valid_base_ndcg_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# CF_refl_path="iter_pool/${dataset_name}_CF_B1_maxFM_cluster_t1.0_te_new"
# EP_refl_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# IP_refl_path="iter_pool/${dataset_name}_attr_B1_maxFM_cluster_t1.0_te_new"
# ex="run_ppo_rt_${random_thresh}_bs_${batch_size}_${reflect_act_dim}_arm_0_iter_${iter_num}"
# nohup python refl_selection_training.py -dn ${dataset_name} \
#     -in ${iter_num} \
#     -vsp ${valid_sample_path} \
#     -vbnp ${valid_base_ndcg_path} \
#     -crp ${CF_refl_path} \
#     -erp ${EP_refl_path} \
#     -irp ${IP_refl_path} \
#     -gi ${gpu_id} \
#     -bs ${batch_size} \
#     -mbs ${batch_size}\
#     -rad ${reflect_act_dim}\
#     --savedir ${dataset_name}_${ex}_train_model \
#     -rt ${random_thresh}\
#     > rl_select/logs/${dataset_name}_${ex}-20240728.log 2>&1 &

# dataset_name="Amazon_Instruments"
# iter_num=10
# # CUDA_VISIBLE_DEVICES=4
# gpu_id=4
# random_thresh=0.9
# batch_size=128
# reflect_act_dim=3
# valid_sample_path="prepare_cluster_user/dataset/${dataset_name}/new_valid_samples.json"
# valid_base_ndcg_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# CF_refl_path="iter_pool/${dataset_name}_CF_B1_maxFM_cluster_t1.0_te_new"
# EP_refl_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# IP_refl_path="iter_pool/${dataset_name}_attr_B1_maxFM_cluster_t1.0_te_new"
# ex="run_ppo_rt_${random_thresh}_bs_${batch_size}_${reflect_act_dim}_arm_0_iter_${iter_num}"
# nohup python refl_selection_training.py -dn ${dataset_name} \
#     -in ${iter_num} \
#     -vsp ${valid_sample_path} \
#     -vbnp ${valid_base_ndcg_path} \
#     -crp ${CF_refl_path} \
#     -erp ${EP_refl_path} \
#     -irp ${IP_refl_path} \
#     -gi ${gpu_id} \
#     -bs ${batch_size} \
#     -mbs ${batch_size}\
#     -rad ${reflect_act_dim} \
#     --savedir ${dataset_name}_${ex}_train_model \
#     -rt ${random_thresh}\
#     > rl_select/logs/${dataset_name}_${ex}-20240728.log 2>&1 &

# dataset_name="Amazon_Arts"
# iter_num=8
# # CUDA_VISIBLE_DEVICES=5
# gpu_id=4
# random_thresh=0.9
# batch_size=64
# reflect_act_dim=20
# valid_sample_path="prepare_cluster_user/dataset/${dataset_name}/new_valid_samples.json"
# valid_base_ndcg_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# # valid_improve_path="log_results/vn2_rp2rwrp2_title_uf_uuc_${dataset_name}"
# CF_refl_path="iter_pool/${dataset_name}_CF_B1_maxFM_cluster_t1.0_te_new"
# EP_refl_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# IP_refl_path="iter_pool/${dataset_name}_attr_B1_maxFM_cluster_t1.0_te_new"
# ex="run_ppo_vir_rt_${random_thresh}_bs_${batch_size}_${reflect_act_dim}_arm_0_iter_${iter_num}"
# nohup python refl_selection_training.py -dn ${dataset_name} \
#     -in ${iter_num} \
#     -vsp ${valid_sample_path} \
#     -vbnp ${valid_base_ndcg_path} \
#     -crp ${CF_refl_path} \
#     -erp ${EP_refl_path} \
#     -irp ${IP_refl_path} \
#     -gi ${gpu_id} \
#     -bs ${batch_size} \
#     -mbs ${batch_size}\
#     -rad ${reflect_act_dim}\
#     --savedir ${dataset_name}_${ex}_train_model \
#     -rt ${random_thresh}\
#     -vip ${valid_improve_path} \
#     > rl_select/logs/${dataset_name}_${ex}-20240728.log 2>&1 &

# dataset_name="Amazon_Instruments"
# iter_num=8
# # CUDA_VISIBLE_DEVICES=5
# gpu_id=7
# random_thresh=0.9
# batch_size=64
# reflect_act_dim=20
# valid_sample_path="prepare_cluster_user/dataset/${dataset_name}/new_valid_samples.json"
# valid_base_ndcg_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# # valid_improve_path="log_results/vn2_rp2rwrp2_title_uf_uuc_${dataset_name}"
# CF_refl_path="iter_pool/${dataset_name}_CF_B1_maxFM_cluster_t1.0_te_new"
# EP_refl_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# IP_refl_path="iter_pool/${dataset_name}_attr_B1_maxFM_cluster_t1.0_te_new"
# ex="run_ppo_vir_rt_${random_thresh}_bs_${batch_size}_${reflect_act_dim}_arm_0_iter_${iter_num}"
# nohup python refl_selection_training.py -dn ${dataset_name} \
#     -in ${iter_num} \
#     -vsp ${valid_sample_path} \
#     -vbnp ${valid_base_ndcg_path} \
#     -crp ${CF_refl_path} \
#     -erp ${EP_refl_path} \
#     -irp ${IP_refl_path} \
#     -gi ${gpu_id} \
#     -bs ${batch_size} \
#     -mbs ${batch_size}\
#     -rad ${reflect_act_dim}\
#     --savedir ${dataset_name}_${ex}_train_model \
#     -rt ${random_thresh}\
#     -vip ${valid_improve_path} \
#     > rl_select/logs/${dataset_name}_${ex}-20240728.log 2>&1 &

######################### PPO comparison

# dataset_name="Amazon_Games"
# iter_num=8
# # CUDA_VISIBLE_DEVICES=5
# gpu_id=3
# random_thresh=0.9
# batch_size=64
# reflect_act_dim=20
# valid_sample_path="prepare_cluster_user/dataset/${dataset_name}/new_valid_samples.json"
# valid_base_ndcg_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# valid_improve_path=""
# CF_refl_path="iter_pool/${dataset_name}_CF_B1_maxFM_cluster_t1.0_te_new"
# EP_refl_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# IP_refl_path="iter_pool/${dataset_name}_attr_B1_maxFM_cluster_t1.0_te_new"
# ex="run_ppo_vir_rt_${random_thresh}_bs_${batch_size}_${reflect_act_dim}_arm_0_iter_${iter_num}"
# nohup python refl_selection_training.py -dn ${dataset_name} \
#     -in ${iter_num} \
#     -vsp ${valid_sample_path} \
#     -vbnp ${valid_base_ndcg_path} \
#     -crp ${CF_refl_path} \
#     -erp ${EP_refl_path} \
#     -irp ${IP_refl_path} \
#     -gi ${gpu_id} \
#     -bs ${batch_size} \
#     -mbs ${batch_size}\
#     -rad ${reflect_act_dim}\
#     --savedir ${dataset_name}_${ex}_train_model \
#     -rt ${random_thresh}\
#     > rl_select/logs/${dataset_name}_${ex}-20240728.log 2>&1 &

# dataset_name="Amazon_Arts"
# iter_num=8
# # CUDA_VISIBLE_DEVICES=5
# gpu_id=4
# random_thresh=0.9
# batch_size=64
# reflect_act_dim=20
# valid_sample_path="prepare_cluster_user/dataset/${dataset_name}/new_valid_samples.json"
# valid_base_ndcg_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# valid_improve_path=""
# CF_refl_path="iter_pool/${dataset_name}_CF_B1_maxFM_cluster_t1.0_te_new"
# EP_refl_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# IP_refl_path="iter_pool/${dataset_name}_attr_B1_maxFM_cluster_t1.0_te_new"
# ex="run_ppo_vir_rt_${random_thresh}_bs_${batch_size}_${reflect_act_dim}_arm_0_iter_${iter_num}"
# nohup python refl_selection_training.py -dn ${dataset_name} \
#     -in ${iter_num} \
#     -vsp ${valid_sample_path} \
#     -vbnp ${valid_base_ndcg_path} \
#     -crp ${CF_refl_path} \
#     -erp ${EP_refl_path} \
#     -irp ${IP_refl_path} \
#     -gi ${gpu_id} \
#     -bs ${batch_size} \
#     -mbs ${batch_size}\
#     -rad ${reflect_act_dim}\
#     --savedir ${dataset_name}_${ex}_train_model \
#     -rt ${random_thresh}\
#     > rl_select/logs/${dataset_name}_${ex}-20240728.log 2>&1 &

# dataset_name="Amazon_Instruments"
# iter_num=8
# # CUDA_VISIBLE_DEVICES=5
# gpu_id=7
# random_thresh=0.9
# batch_size=64
# reflect_act_dim=20
# valid_sample_path="prepare_cluster_user/dataset/${dataset_name}/new_valid_samples.json"
# valid_base_ndcg_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# valid_improve_path=""
# CF_refl_path="iter_pool/${dataset_name}_CF_B1_maxFM_cluster_t1.0_te_new"
# EP_refl_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# IP_refl_path="iter_pool/${dataset_name}_attr_B1_maxFM_cluster_t1.0_te_new"
# ex="run_ppo_vir_rt_${random_thresh}_bs_${batch_size}_${reflect_act_dim}_arm_0_iter_${iter_num}"
# nohup python refl_selection_training.py -dn ${dataset_name} \
#     -in ${iter_num} \
#     -vsp ${valid_sample_path} \
#     -vbnp ${valid_base_ndcg_path} \
#     -crp ${CF_refl_path} \
#     -erp ${EP_refl_path} \
#     -irp ${IP_refl_path} \
#     -gi ${gpu_id} \
#     -bs ${batch_size} \
#     -mbs ${batch_size}\
#     -rad ${reflect_act_dim}\
#     --savedir ${dataset_name}_${ex}_train_model \
#     -rt ${random_thresh}\
#     > rl_select/logs/${dataset_name}_${ex}-20240728.log 2>&1 &

######################

# dataset_name="Amazon_Games"
# iter_num=10
# # CUDA_VISIBLE_DEVICES=5
# gpu_id=3
# random_thresh=0.9
# batch_size=64
# reflect_act_dim=3
# lr_a=0.001
# lr_c=0.001
# valid_sample_path="prepare_cluster_user/dataset/${dataset_name}/new_valid_samples.json"
# valid_base_ndcg_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# valid_improve_path=""
# CF_refl_path="iter_pool/${dataset_name}_CF_B1_maxFM_cluster_t1.0_te_new"
# EP_refl_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# IP_refl_path="iter_pool/${dataset_name}_attr_B1_maxFM_cluster_t1.0_te_new"
# ex="run_ppo_lr_a_${lr_a}_lc_c_${lr_c}_rt_${random_thresh}_bs_${batch_size}_${reflect_act_dim}_arm_0_iter_${iter_num}"
# nohup python refl_selection_training.py -dn ${dataset_name} \
#     -in ${iter_num} \
#     -vsp ${valid_sample_path} \
#     -vbnp ${valid_base_ndcg_path} \
#     -crp ${CF_refl_path} \
#     -erp ${EP_refl_path} \
#     -irp ${IP_refl_path} \
#     -gi ${gpu_id} \
#     -bs ${batch_size} \
#     -mbs ${batch_size}\
#     --lr_a ${lr_a}\
#     --lr_c ${lr_c}\
#     -rad ${reflect_act_dim}\
#     --savedir ${dataset_name}_${ex}_train_model \
#     -rt ${random_thresh}\
#     > rl_select/logs/${dataset_name}_${ex}-20240731.log 2>&1 &

# dataset_name="Amazon_Arts"
# iter_num=10
# # CUDA_VISIBLE_DEVICES=5
# gpu_id=4
# random_thresh=0.9
# batch_size=64
# reflect_act_dim=3
# lr_a=0.001
# lr_c=0.001
# valid_sample_path="prepare_cluster_user/dataset/${dataset_name}/new_valid_samples.json"
# valid_base_ndcg_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# valid_improve_path=""
# CF_refl_path="iter_pool/${dataset_name}_CF_B1_maxFM_cluster_t1.0_te_new"
# EP_refl_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
# IP_refl_path="iter_pool/${dataset_name}_attr_B1_maxFM_cluster_t1.0_te_new"
# ex="run_ppo_lr_a_${lr_a}_lc_c_${lr_c}_rt_${random_thresh}_bs_${batch_size}_${reflect_act_dim}_arm_0_iter_${iter_num}"
# nohup python refl_selection_training.py -dn ${dataset_name} \
#     -in ${iter_num} \
#     -vsp ${valid_sample_path} \
#     -vbnp ${valid_base_ndcg_path} \
#     -crp ${CF_refl_path} \
#     -erp ${EP_refl_path} \
#     -irp ${IP_refl_path} \
#     -gi ${gpu_id} \
#     -bs ${batch_size} \
#     -mbs ${batch_size}\
#     --lr_a ${lr_a}\
#     --lr_c ${lr_c}\
#     -rad ${reflect_act_dim}\
#     --savedir ${dataset_name}_${ex}_train_model \
#     -rt ${random_thresh}\
#     > rl_select/logs/${dataset_name}_${ex}-20240731.log 2>&1 &

dataset_name="Amazon_Instruments"
iter_num=10
# CUDA_VISIBLE_DEVICES=5
gpu_id=7
random_thresh=0.9
batch_size=64
reflect_act_dim=3
lr_a=0.001
lr_c=0.001
valid_sample_path="prepare_cluster_user/dataset/${dataset_name}/new_valid_samples.json"
valid_base_ndcg_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
valid_improve_path=""
CF_refl_path="iter_pool/${dataset_name}_CF_B1_maxFM_cluster_t1.0_te_new"
EP_refl_path="iter_pool/${dataset_name}_title_B1_maxFM_cluster_user_first_t1.0_te_new"
IP_refl_path="iter_pool/${dataset_name}_attr_B1_maxFM_cluster_t1.0_te_new"
ex="run_ppo_lr_a_${lr_a}_lc_c_${lr_c}_rt_${random_thresh}_bs_${batch_size}_${reflect_act_dim}_arm_0_iter_${iter_num}"
nohup python refl_selection_training.py -dn ${dataset_name} \
    -in ${iter_num} \
    -vsp ${valid_sample_path} \
    -vbnp ${valid_base_ndcg_path} \
    -crp ${CF_refl_path} \
    -erp ${EP_refl_path} \
    -irp ${IP_refl_path} \
    -gi ${gpu_id} \
    -bs ${batch_size} \
    -mbs ${batch_size}\
    --lr_a ${lr_a}\
    --lr_c ${lr_c}\
    -rad ${reflect_act_dim}\
    --savedir ${dataset_name}_${ex}_train_model \
    -rt ${random_thresh}\
    > rl_select/logs/${dataset_name}_${ex}-20240731.log 2>&1 &