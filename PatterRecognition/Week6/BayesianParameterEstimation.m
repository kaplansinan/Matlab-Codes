function [ mu, sigma ] = BayesianParameterEstimation(m0,data,cov0,cov,n)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
total=zeros(1);
 for i=1:n
    total=total+data(:,[i]);
    
end
total=total/n;
A=inv((cov0+(1/n)*cov));
d=cov0*A;
C=(1/n)*cov*A*m0;
mu=d*total+C; %mu

sigma=d*(1*n)*cov+cov;

end

