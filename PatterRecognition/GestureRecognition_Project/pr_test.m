% Testing the perfomance of the classification algorithm using
% "leave-one-out" method

clear all
close all
clc

load('for_test.mat');

k = 3; % Number of neighbours

class = [];
for i=1:size(traindata_ft,2)
    ind = true(1,size(traindata_ft,2));
    ind(i) = false;
    
    traindata = traindata_ft(:,ind);
    testdata = traindata_ft(:,~ind);
    
    % Principal component analysis(PCA)
    Cov_mat = cov(traindata');
    [V, D] = eig(Cov_mat);
    D = diag(D);
    sum_eig = sum(D);
    s = 0;
    ctrl = size(D,1);
    while(s/sum_eig < 0.98)
        s = s + D(ctrl);
        ctrl = ctrl-1;
    end
    W = V(:,(ctrl+1):size(D,1));
    traindata = W'*traindata;
    testdata = W'*testdata;
    
    [C,~] = knn(trainclass(:,ind),traindata,testdata,k);
    class = [class C];
end

errors = sum(trainclass ~= class)