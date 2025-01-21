
#########################################
# dataset_name='Amazon_Games'
# ex='CF_B1_maxFM_cluster_t1.0_te_new' # remember to change
# CUDA_VISIBLE_DEVICES=2  \
# nohup  python -u refl_refining_iteration.py  -dn $dataset_name -ex $ex\
#     --refl_type 'CF' \
#     -bs 12 -bs2 3 \
#     --max_iter 15 \
#     --fs_do_sample \
#     --fs_temperature 1.0 \
#     --fusion_mode 'max' \
#     --use_user_cluster \
#     > log/new_iter_${dataset_name}_${ex}-2024-07-15.log 2>&1 &

# dataset_name='Amazon_Arts'
# ex='CF_B1_maxFM_cluster_t1.0_te_new' # remember to change
# CUDA_VISIBLE_DEVICES=4  \
# nohup  python -u refl_refining_iteration.py  -dn $dataset_name -ex $ex\
#     --refl_type 'CF' \
#     -bs 12 -bs2 3 \
#     --max_iter 15 \
#     --fs_do_sample \
#     --fs_temperature 1.0 \
#     --fusion_mode 'max' \
#     --use_user_cluster \
#     > log/new_iter_${dataset_name}_${ex}-2024-07-15.log 2>&1 &

# dataset_name='Amazon_Instruments'
# ex='CF_B1_maxFM_cluster_t1.0_te_new' # remember to change
# CUDA_VISIBLE_DEVICES=6  \
# nohup  python -u refl_refining_iteration.py  -dn $dataset_name -ex $ex\
#     --refl_type 'CF' \
#     -bs 12 -bs2 3 \
#     --max_iter 15 \
#     --fs_do_sample \
#     --fs_temperature 1.0 \
#     --fusion_mode 'max' \
#     --use_user_cluster \
#     > log/new_iter_${dataset_name}_${ex}-2024-07-15.log 2>&1 &

# dataset_name='Amazon_Games'
# ex='IP_B1_maxFM_cluster_t1.0_te_new' # remember to change
# CUDA_VISIBLE_DEVICES=7  \
# nohup  python -u refl_refining_iteration.py  -dn $dataset_name -ex $ex\
#     --refl_type 'IPibute' \
#     -bs 12 -bs2 3 \
#     --max_iter 15 \
#     --fs_do_sample \
#     --fs_temperature 1.0 \
#     --fusion_mode 'max' \
#     --use_user_cluster \
#     > log/new_iter_${dataset_name}_${ex}-2024-07-15.log 2>&1 &

####################################
# dataset_name='Amazon_Games'
# ex='CF_B1_maxFM_cluster_t1.0_te_new' # remember to change
# CUDA_VISIBLE_DEVICES=2  \
# nohup  python -u refl_refining_iteration.py  -dn $dataset_name -ex $ex\
#     --refl_type 'CF' \
#     -bs 12 -bs2 3 \
#     --max_iter 15 \
#     --load_base_dir 'iter_pool/{dataset_name}_CF_B1_maxFM_cluster_t1.0_te_new' \
#     --fs_do_sample \
#     --fs_temperature 1.0 \
#     --fusion_mode 'max' \
#     --use_user_cluster \
#     --DBG 1 \
#     > log/new_iter_${dataset_name}_${ex}-2024-07-15.log 2>&1 &
#####################################

# dataset_name='Amazon_Games'
# ex='CF_B1_maxFM_cluster_t1.0_te_new' # remember to change
# CUDA_VISIBLE_DEVICES=2  \
# nohup  python -u refl_refining_iteration.py  -dn $dataset_name -ex $ex\
#     --refl_type 'CF' \
#     -bs 12 -bs2 3 \
#     --max_iter 15 \
#     --load_base_dir 'iter_pool/{dataset_name}_CF_B1_maxFM_cluster_t1.0_te_new' \
#     --fs_do_sample \
#     --fs_temperature 1.0 \
#     --fusion_mode 'max' \
#     --use_user_cluster \
#     > log/new_iter_${dataset_name}_${ex}-2024-07-15.log 2>&1 &

# dataset_name='Amazon_Arts'
# ex='CF_B1_maxFM_cluster_t1.0_te_new' # remember to change
# CUDA_VISIBLE_DEVICES=4  \
# nohup  python -u refl_refining_iteration.py  -dn $dataset_name -ex $ex\
#     --refl_type 'CF' \
#     -bs 12 -bs2 3 \
#     --max_iter 15 \
#     --load_base_dir 'iter_pool/{dataset_name}_CF_B1_maxFM_cluster_t1.0_te_new' \
#     --fs_do_sample \
#     --fs_temperature 1.0 \
#     --fusion_mode 'max' \
#     --use_user_cluster \
#     > log/new_iter_${dataset_name}_${ex}-2024-07-15.log 2>&1 &

# dataset_name='Amazon_Instruments'
# ex='CF_B1_maxFM_cluster_t1.0_te_new' # remember to change
# CUDA_VISIBLE_DEVICES=6  \
# nohup  python -u refl_refining_iteration.py  -dn $dataset_name -ex $ex\
#     --refl_type 'CF' \
#     -bs 12 -bs2 3 \
#     --max_iter 15 \
#     --load_base_dir 'iter_pool/{dataset_name}_CF_B1_maxFM_cluster_t1.0_te_new' \
#     --fs_do_sample \
#     --fs_temperature 1.0 \
#     --fusion_mode 'max' \
#     --use_user_cluster \
#     > log/new_iter_${dataset_name}_${ex}-2024-07-15.log 2>&1 &

# dataset_name='Amazon_Games'
# ex='IP_B1_maxFM_cluster_t1.0_te_new' # remember to change
# CUDA_VISIBLE_DEVICES=7  \
# nohup  python -u refl_refining_iteration.py  -dn $dataset_name -ex $ex\
#     --refl_type 'IPibute' \
#     -bs 12 -bs2 3 \
#     --max_iter 15 \
#     --load_base_dir 'iter_pool/{dataset_name}_IP_B1_maxFM_cluster_t1.0_te_new' \
#     --fs_do_sample \
#     --fs_temperature 1.0 \
#     --fusion_mode 'max' \
#     --use_user_cluster \
#     > log/new_iter_${dataset_name}_${ex}-2024-07-15.log 2>&1 &

# dataset_name='Amazon_Arts'
# ex='IP_B1_maxFM_cluster_t1.0_te_new' # remember to change
# CUDA_VISIBLE_DEVICES=1  \
# nohup  python -u refl_refining_iteration.py  -dn $dataset_name -ex $ex\
#     --refl_type 'IPibute' \
#     -bs 12 -bs2 3 \
#     --max_iter 15 \
#     --load_base_dir 'iter_pool/{dataset_name}_IP_B1_maxFM_cluster_t1.0_te_new' \
#     --fs_do_sample \
#     --fs_temperature 1.0 \
#     --fusion_mode 'max' \
#     --use_user_cluster \
#     > log/new_iter_${dataset_name}_${ex}-2024-07-16.log 2>&1 &

# dataset_name='Amazon_Instruments'
# ex='IP_B1_maxFM_cluster_t1.0_te_new' # remember to change
# CUDA_VISIBLE_DEVICES=3  \
# nohup  python -u refl_refining_iteration.py  -dn $dataset_name -ex $ex\
#     --refl_type 'IPibute' \
#     -bs 12 -bs2 3 \
#     --max_iter 15 \
#     --load_base_dir 'iter_pool/{dataset_name}_IP_B1_maxFM_cluster_t1.0_te_new' \
#     --fs_do_sample \
#     --fs_temperature 1.0 \
#     --fusion_mode 'max' \
#     --use_user_cluster \
#     > log/new_iter_${dataset_name}_${ex}-2024-07-16.log 2>&1 &

###############################################

# dataset_name='Amazon_Games'
# ex='EP_B1_maxFM_cluster_t1.0_te_new' # remember to change
# CUDA_VISIBLE_DEVICES=2  \
# nohup  python -u refl_refining_iteration.py  -dn $dataset_name -ex $ex\
#     --refl_type 'EP' \
#     -bs 12 -bs2 4 \
#     --max_iter 15 \
#     --fs_do_sample \
#     --fs_temperature 1.0 \
#     --fusion_mode 'max' \
#     --use_user_cluster \
#     > log/new_iter_${dataset_name}_${ex}-2024-07-17.log 2>&1 &

# dataset_name='Amazon_Instruments'
# ex='EP_B1_maxFM_cluster_t1.0_te_new' # remember to change
# CUDA_VISIBLE_DEVICES=7  \
# nohup  python -u refl_refining_iteration.py  -dn $dataset_name -ex $ex\
#     --refl_type 'EP' \
#     -bs 12 -bs2 4 \
#     --max_iter 15 \
#     --fs_do_sample \
#     --fs_temperature 1.0 \
#     --fusion_mode 'max' \
#     --use_user_cluster \
#     > log/new_iter_${dataset_name}_${ex}-2024-07-17.log 2>&1 &

##########################################

# dataset_name='Amazon_Arts'
# ex='EP_B1_maxFM_cluster_t1.0_te_new' # remember to change
# CUDA_VISIBLE_DEVICES=6  \
# nohup  python -u refl_refining_iteration.py  -dn $dataset_name -ex $ex\
#     --refl_type 'EP' \
#     -bs 12 -bs2 4 \
#     --max_iter 15 \
#     --fs_do_sample \
#     --fs_temperature 1.0 \
#     --fusion_mode 'max' \
#     --use_user_cluster \
#     > log/new_iter_${dataset_name}_${ex}-2024-07-18.log 2>&1 &

##########################################

# dataset_name='Amazon_Games'
# ex='EP_B1_maxFM_cluster_user_first_t1.0_te_new' # remember to change
# CUDA_VISIBLE_DEVICES=2  \
# nohup  python -u refl_refining_iteration.py  -dn $dataset_name -ex $ex\
#     --refl_type 'EP' \
#     -bs 12 -bs2 4 \
#     --max_iter 15 \
#     --fs_do_sample \
#     --fs_temperature 1.0 \
#     --fusion_mode 'max' \
#     --use_user_cluster \
#     --user_first \
#     > log/new_iter_${dataset_name}_${ex}-2024-07-19.log 2>&1 &

dataset_name='Amazon_Instruments'
ex='EP_B1_maxFM_cluster_user_first_t1.0_te_new' # remember to change
CUDA_VISIBLE_DEVICES=4  \
nohup  python -u refl_refining_iteration.py  -dn $dataset_name -ex $ex\
    --refl_type 'EP' \
    -bs 12 -bs2 4 \
    --max_iter 15 \
    --fs_do_sample \
    --fs_temperature 1.0 \
    --fusion_mode 'max' \
    --use_user_cluster \
    --user_first \
    > log/new_iter_${dataset_name}_${ex}-2024-07-19.log 2>&1 &

dataset_name='Amazon_Arts'
ex='EP_B1_maxFM_cluster_user_first_t1.0_te_new' # remember to change
CUDA_VISIBLE_DEVICES=7  \
nohup  python -u refl_refining_iteration.py  -dn $dataset_name -ex $ex\
    --refl_type 'EP' \
    -bs 12 -bs2 4 \
    --max_iter 15 \
    --fs_do_sample \
    --fs_temperature 1.0 \
    --fusion_mode 'max' \
    --use_user_cluster \
    --user_first \
    > log/new_iter_${dataset_name}_${ex}-2024-07-19.log 2>&1 &