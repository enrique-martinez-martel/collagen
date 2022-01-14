# Collagen
Collagen,  the optimization of data center cooling with AI.


Made by: Genis Bonet García, Giorgi Mikautadze, Akram Aoulad Ben Taib Radi and Enrique Martínez Martel.


## Requirements 
1. Matlab
2. Simulink
3. Simscape
4. Reinforcement Learning Toolbox
5. Parallelization Toolbox.

## How to execute our programn.
1. Execute the first part of the mlx code to create a neural network with the specified characteristics.
2. Execute the second and third parts of the mlx to train the neural network using the slx specified model.
3. Execute the foirth part for a demonstration or alternatively save the trained model with the last partition.

The code can be executed all at once to provide the same results, but without an opportunity to tweak parameters during the execution.

## "6SigmaRoom Model" directory contains two files. 
    -The first one is the "client" directory which contains another 2 files "SimpleClientExample_Matlab.m" and "SimpleClientExample_Matlab.room". The first file is a small example providen by FutureFacilities in order to understand how the model works, it can be open with matlab. The second one is an example of a small datacenter and it can be open with the 6SigmaRoom software.
    -The second one is the "DatacenterModelSigma.room" file, it can only be opened if you have access to the 6SigmaRoom software. It contains the model and design of our practical demonstration.

## "Matlab Agent" directory contains two files. 
    -The first one is the "collagenSim.slx" file and its the environment in which our agent trains.
    -The second one is the "RLsetupRun.mlx" it contains the initialization, training options and set up that our artificial neural network uses to train.
