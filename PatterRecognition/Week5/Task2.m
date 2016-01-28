%define range of x-axis

%initialize parameters
mu1=[3;6];      %mean of class 1
mu2=[3;-2];     % mean of class 2
mu3=[11;-2];    % mean of class 3
cov1=[1/2 0;0 2];   %covariances of class 1
cov2=[2 0;0 2];     %covariances of class 2
cov3=[2 0;0 1/2];   %covariances of class 3
%call function quadratic boundaries
[W1 w1 w10]=quaddecbound(mu1,cov1);
[W2 w2 w20]=quaddecbound(mu2,cov2);
[W3 w3 w30]=quaddecbound(mu3,cov3);
