% Extracting the features, PCA, saving transformed data to MATLAB-file
clear all
close all
clc

traindata = [];
trainclass = [];

% o = 1;
% Parsing the raw data
for i=2:8 % number of person
    for j=1:7 % number of movement
        for k=1:12 % number of demonstration
            
            S = {'train/','p',num2str(i),'m',num2str(j),'d',num2str(k),'.mat'};
            file_name = strjoin(S,'');
            if( exist(file_name)==2 )
                s = load(file_name, '-ascii');
%                 raw(o) = {s};
%                 o = o+1;
                f = extract_feature(s);
                
                traindata = [traindata f];
                trainclass = [trainclass j];
            end
        end
    end
end

traindata_ft = traindata; % save untransformed data for testing

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

% Saving data
save('traindata.mat','traindata','trainclass','W');
save('for_test.mat', 'traindata_ft', 'trainclass');

