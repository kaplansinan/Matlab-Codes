function C = pr_classify(testdata)
% Classifies the given data based on the training set. 
% 
% The classification is made based on the kNN algorithm with k = 3


% The file 'traindata.mat' contains 2 variables: traindata - set of samples, where 
% each column corresponds to the specific sample, each row - to the
% specific feature; trainclass - array of classes for each sample;

load('traindata.mat'); % load traindata, trainclass and W(matrix we got from PCA)

k = 3; % Number of neighbours
tdata = extract_feature(testdata);
tdata = W'*tdata; % PCA-transformation

[C,~] = knn(trainclass,traindata,tdata,k);