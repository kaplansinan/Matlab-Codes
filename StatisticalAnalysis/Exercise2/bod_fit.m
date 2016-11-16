%%%%% LSQ fitting with the BOD model
clear all; close all; clc;

b_0 = [1 0.1];      % initial quess for the optimizer
x   = [1 4 7 10 13 16 19]';     % x-data
y    = [0.43 1.29 1.96 2.32 2.77 2.83 2.70]';    % y-data
data = [x,y];       % data matrix
n = length(x);      % number of data points

%%%% Get estimate for sigma**2 from the residual Sum of Squares
[bmin,ssmin]=fminsearch(@bod_ss,b_0,[],data);

%%%% Compute the Jacobian analytically
J = [1-exp(-bmin(2).*x),x.*bmin(1).*exp(-x.*bmin(2))];

%%%% Compute the covariance and print the parameter estimates
sigma2 = ssmin/(n-2); % std of measurument noise estimated by the residuals
C = sigma2*inv(J'*J);
disp('(theta, std, t-values):'); 
[bmin(:) sqrt(diag(C)) bmin(:)./sqrt(diag(C))]

%%%% visualize the fit
xx=linspace(0,10);
yy=bmin(1)*(1-exp(-bmin(2)*x));
plot(x,yy,x,y,'ro');
hold on
plot(x,b_0(1)*(1-exp(-b_0(2)*x)),'g')
xlabel('x'); ylabel('y=\theta_1(1-exp (\theta_2 x))');
% 
% %%% visualize the confidence ellipses
% figure(2)
% plot(bmin(1),bmin(2),'r.','MarkerSize',20); hold on;
% ellipse(bmin,chiqf(0.5,2)*C,'k-','LineWidth',2);
% ellipse(bmin,chiqf(0.9,2)*C,'k--','LineWidth',2); hold off;
% axis tight;
% xlabel('\theta_1'); ylabel('\theta_2');
% legend('LSQ estimate','50% ellipse','90% ellipse');