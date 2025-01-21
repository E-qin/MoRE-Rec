from recbole.quick_start import run_recbole
from recbole.config import Config
from recbole.data import create_dataset, data_preparation

# get CF model, current setting still needs completion. BASELINE: DMF
dataset = ['Amazon_Arts', 'Amazon_Games', 'Amazon_Instruments']
model_list = ['DMF']
filtered_dataset = []
for data in dataset:
    for model in model_list:
        curr_model_conf_path = "./DMF configs/" + data + ".yaml"
        config = Config(model=model, dataset=data, config_file_list=[curr_model_conf_path])
        curr_dataset = create_dataset(config)
        curr_dataset.save()
        print("Dataset Saved OK.")
        print("Start Training.")
        run_recbole(model=model, dataset=data, config_file_list=[curr_model_conf_path])
        print("current model is: ", model)
        print("current dataset is: ", data)
        print("Finished running.")
        print("--------------------------------------")
print("All finished.")
# run_recbole(model='DMF', dataset='Amazon_Instruments', config_file_list=['Amazon_Instruments.yaml'])
# run_recbole(model='DMF', dataset='Amazon_Books', config_file_list=['Amazon_Books.yaml'])
# run_recbole(model='DMF', dataset='steam', config_file_list=['steam.yaml'])