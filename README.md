# brunelFYP

Osc_data_monitor include:
This application has been modified to save the data that has is being streamed from the muse via the MindMonitor app on an android device. The application came from https://www.kasperkamperman.com/blog/processing-code/osc-datamonitor/

Data_engineering includes:
- data_processing which cleans the data removing unwanted data from the txt files in each section
- data_seperation seperated the data so that all the data for each stimuli is together and outputs a clean csv
- /data/ is the original data
- /new_data/ from the data_processing 
- processed_data.csv is final data format

Training_process includes :
- processed_data.csv is the data that was originally used and then separated into the datasets in /processed_paired_stimuli/
- NeuralNetwork and training-part 1 are testing scripts for the algorithms 
- final_training which is the final form of the algorithms trained on all the data 
- algorithm_data.json and randomforest_results.json is where all the results from training is stored
- algorithm_data_analysis is where the data is analysed and so the final algorithms can be trained on the right dataset
- the rf_model.pkl , svm_model.pkl and model.h5 are the algorithm trained and saved

Final prototype includes:
- predicting_direction which is a test of predicting the direction
- final_program is the final version of the prototype
- test_finalprototype is testing for the final_program
- direction.json is the output of the final_program
- all files in /test_data/ are testing data

Robot includes:
- direction.json which contains the predicted direction
-io_wrapper which wraps the motors on the robot
-robot.py which executes the direction from direction.json
