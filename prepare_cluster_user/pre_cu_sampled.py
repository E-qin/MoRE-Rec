from recbole.quick_start import load_data_and_model
import torch
from sklearn.cluster import KMeans
import json
import os

def pre_cu():
    # NOTE remember to replace these with your dataset
    # Arts
    # model_path = "/data1/CoAuthor2/Reflect-REC/prepare_CF_data/saved/DMF-Jul-03-2024_16-11-39.pth"
    # Games
    # model_path = "/data1/CoAuthor2/Reflect-REC/prepare_CF_data/saved/DMF-Jul-03-2024_16-13-31.pth"
    # Instruments
    model_path = "/data1/CoAuthor2/Reflect-REC/prepare_CF_data/saved/DMF-Jul-03-2024_16-15-08.pth"

    config, model, dataset, train_data, valid_data, test_data  = load_data_and_model(
        model_file=model_path,
    )
    sample_num = 1000
    # load user_id from the dataset
    with open(f"./dataset_sampled/{dataset.dataset_name}/users_{sample_num}.json", "r") as f:
        user_id = json.load(f)

    # cluster user_id from model's user embeddings
    total_user_emb = []
    for i in user_id:
        i = int(i)
        user_emb = model.get_user_embedding(torch.tensor([i, ])).cpu().detach().numpy().reshape(-1)
        total_user_emb.append(user_emb)

    # use KMeans to cluster user embeddings
    n_clusters = 20
    random_seed = 2024
    kmeans = KMeans(n_clusters=n_clusters, random_state=random_seed).fit(total_user_emb)
    user_cluster = kmeans.labels_.tolist()

    # save user's cluster, note that the user_id starts from 1 (ignore padding)
    user_cluster_dict = {}
    curr_idx = 0
    for i in user_id:
        user_cluster_dict[i] = user_cluster[curr_idx]
        curr_idx += 1

    dataset_name = dataset.dataset_name
    with open(f"./dataset_sampled/{dataset_name}/user_cluster.json", "w") as f:
        json.dump(user_cluster_dict, f)
    print("user clustering done!")

    # save cluster center
    cluster_center = kmeans.cluster_centers_
    cluster_center_dict = {}
    for i in range(n_clusters):
        cluster_center_dict[i] = cluster_center[i].tolist()
    with open(f"./dataset_sampled/{dataset_name}/cluster_center.json", "w") as f:
        json.dump(cluster_center_dict, f)
    print("cluster center saved!")

if __name__ == "__main__":
    os.environ["CUDA_VISIBLE_DEVICES"] = "3"
    pre_cu()