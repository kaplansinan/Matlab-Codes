function [subset, idx] = createsubset( data,max)
%This functiom simply creates random subset from the data.
%subset has different number of features and samples from data
%   data-> row vector data
%   max -> max number of features in the given data set

%calculate number of samples which will be in subset
%15<=ns<=total number of samples in data
ns=randi([15 size(data,2)+1]);

%sample data 
[subset,idx] = datasample(transpose(data),ns);
%number of fetatures will be deleted
nf = randi([0 max]);
if (nf>0) % if nf>0 then just create subset also that has different number of features
    % get different random features to be deleted
    list = randperm(max+1,nf);
    subset(:,list)=[];

end
% get different random features to be deleted
%p = randperm(maxim+1,r);
%x=y;
%y(:,p) = [];

end

