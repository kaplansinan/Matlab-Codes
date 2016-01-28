n=3; %number of components
len=length(gmmdata)
%divide data to n component to calculate initial values for mean and
%covariances
subdata1=gmmdata(:,1:len/3);
subdata2=gmmdata(:,len/3+1:2*len/3);
subdata3=gmmdata(:,2*len/3+1:len);

%calculate initil mean and covariances for each data set
mu1=mean(subdata1,2)
mu2=mean(subdata2,2)
mu3=mean(subdata3,2)

mu=[mu1 mu2 mu3];

cov1=cov(subdata1(1,:),subdata1(2,:))
cov2=cov(subdata2(1,:),subdata2(2,:))
cov3=cov(subdata3(1,:),subdata3(2,:))

sigma=cat(3,cov1,cov2,cov3);

%initialize starting prior probabilities
P1=1/n;
P2=1/n;
P3=1/n;

% E-step
[r c]=size(mu); % get size of the mean vector

for i=1:len
    % get the sample vector from data matrix
    sample_vec=gmmdata(1:r,i);
    % lopp through each class to compute class
    % cond. probability of each sample vector for each class
    for j=1:c 
        cov=sigma(:,:,j); %get covariances of class j
        %cov
        %det(cov)
        mean=mu(:,j); % get mean of class j
        % compute gaussian  distribution for bayes classification
        exponent=exp((-1/2)*transpose(sample_vec-mean)*inv(cov)*(sample_vec-mean));
        ClassCondProb(j,i)=(1/sqrt(2*pi)*(sqrt(det(cov))))*exponent;
    end % end of inner for loop
end % end of outer for l

%compute loglikelihood
loglikelihood=0;
for i=1:n
    for j=1:len
        loglikelihood=loglikelihood+log(ClassCondProb(i,j)*P1);
    end
end
loglikelihood

%update parameters
%calculate new means


