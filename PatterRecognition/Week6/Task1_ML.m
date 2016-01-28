mu = [0,0]; %// data
sigma = [.5 0; 0 .5]; %// data
x = -5:.1:5; %// x axis
y = -4:.1:4; %// y axis

[X Y] = meshgrid(x,y); %// all combinations of x, y
Z = mvnpdf([X(:) Y(:)],mu,sigma); %// compute Gaussian pdf
Z = reshape(Z,size(X)); %// put into same size as X, Y
%// contour(X,Y,Z), axis equal  %// contour plot; set same scale for x and y...
surf(X,Y,Z) %// ... or 3D plot
X=data(1,1:10)





data=importdata('param_est_data1.mat.txt');
cov=[1 0; 0 1]
cov0=[0.1 0;0 0.1]
m0=[1;2]
[x y]=BayesianParameterEstimation(m0,data,cov0,cov,10)