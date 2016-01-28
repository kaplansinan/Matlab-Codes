function [C, k]=knn(trainclass,traindata,data,k)
% Implementation of knn(k Nearest Neighbours algorithm) for classification
%
% Input:
%   trainclass - array of classes for the samples
%   traindata - array of data, where each column correspond to specific
%   sample, each row - to the specific feature
%   data - array of data to be classified
%   k - preferred number of neighbours used
%
% Output:
%   C - classes for the data, which is needed to be classified
%   k - number of neighbours used


n_data = size(data,2);
n_train = size(traindata,2);
dist = zeros(1,n_train);
C = zeros(1,n_data);
ok = 0;

while(~ok) %check if there is no ambigous decisions(majority voting)
    for i = 1:n_data
        ok = 0;
        for j = 1:n_train
            dist(j) = sqrt(sum((data(:,i) - traindata(:,j)).^2)); % calculate Euclidean distances
        end

        neighbors = zeros(k,1); % find k closest neighbours
        for l = 1:k
            [~, I] = min(dist);
            dist(I) = [];
            neighbors(l) = I;
        end

        % M - the most frequent value, NUM - in case there are more than 1
        % frequent value

        [M, ~, NUM] = mode(trainclass(neighbors)); %voting
        if(size(NUM{1}) == 1 | k == 1)
            C(i) = M;
            ok = 1;
        else
           break; 
        end

        
    end
    if (~ok) 
        k = k-1;
    end
end