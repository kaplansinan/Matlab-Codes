function mu = MLEstimator( data, n )
% data represents the data matrix
% n reprsent the number of samples that will be used to estimate the
% parameters
% data(:,1:20)
% > data=importdata('param_est_data1.mat.txt');
% take first n samples of data to calculate mean

total=zeros(1);
for i=1:n
    total=total+data(:,[i]);
    
end

mu=total/n;
end


