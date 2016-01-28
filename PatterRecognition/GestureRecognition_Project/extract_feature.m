function [features] = extract_feature(data)

% This function extracts features from time series data, dividing the whole
% data into the number of parts. For each part the following
% characteristics are computed: mean, variance, minimum value, maximum
% value. Also, the variance for the whole set is computed.
% 
% Input:
%
%   data - array containing information about the one time series set.
%   bin_array - array containing the numbers for the split. For each
%   number, the data will be divided into that number of parts.
%
% Output:
%
%   features - array containing all the characteristics calculated for the
%   given data.

N = size(data,1);
bin_array = [2 3 4 5]; % Into which number of parts we should split the given data and compute the features

% Normalization(subtraction of mean)
mn = mean(data);
data = data - repmat(mn,size(data,1),1);

features = [var(data,0,1) N]; %variance of the whole data

for i=1:length(bin_array)
    
    bin = bin_array(i); % number of parts in data
    
    % calculate the number of samples in each part
    block = floor(N/bin);
    leftover = N - block*bin;
    hr = 0;
    
    for k=1:bin
        % lr - left range of the particular block of data
        % hr - right range of the particular block of data
        lr = hr + 1;
        if k <= leftover
            hr = lr + block;
        else
            hr = lr + block-1;
        end

        m = mean(data(lr:hr,:),1);
        vr = var(data(lr:hr,:),0,1);
        max_val = max(data(lr:hr,:),[],1);
        min_val = min(data(lr:hr,:),[],1);

        features = [features m vr max_val min_val];
    end
end

features = features'; % return features as a column