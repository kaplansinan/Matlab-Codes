clear all; close all;clc
% addpath C:\Matematica\mcmcstat
x = [1, 4, 7, 10, 13, 16, 19]';
y = [0.43, 1.29, 1.96, 2.32, 2.77, 2.83, 2.70]';
data=[x,y];
N= 100;%number of simulations

theta_0=[1 1]; %initial guess for the parameters
theta_hat=zeros(N+1,2);
rss_N=zeros(N+1,1);

[theta_hat(1,:), rss_N(1)]=fminsearch(@lsq2, theta_0, [], data); %find the first LSQ fit

%%%% visualize the fit
xx1=linspace(0,max(x));
yy1=theta_hat(1,1)*(1-exp(-theta_hat(1,2)*xx1));
figure(1)
hold on
plot(xx1,yy1,'b.-','MarkerSize',10);
plot(x,y,'k^','MarkerSize',10);
xlabel('x'); ylabel('y=\theta_1(1-exp (\theta_2 x))');
hold on

%%%% Compute the Jacobian analytically
J = [1-exp(-theta_hat(1,2).*x),x.*theta_hat(1,1).*exp(-x.*theta_hat(1,2))];

%%%% Compute the covariance and print the parameter estimates
sigma2 = rss_N(1)/(length(x)-2); % std of measurument noise estimated by the residuals
C = sigma2*inv(J'*J);

%%% visualize the confidence ellipses
figure(2)
plot(theta_hat(1,1),theta_hat(1,2),'r.','MarkerSize',20); hold on;
ellipse(theta_hat(1,:),chiqf(0.5,2)*C,'k-','LineWidth',2);
ellipse(theta_hat(1,:),chiqf(0.9,2)*C,'k--','LineWidth',2); hold off;
axis tight;
xlabel('\theta_1'); ylabel('\theta_2');
legend('LSQ estimate','50% ellipse','90% ellipse');

%start the loop of bootstrap
for j=1:N
   index=ceil(rand(length(x),1)*length(x)); %random indexes;
   x_tilde=x(index);
   y_tilde=y(index);
   data=[x_tilde,y_tilde];
   [theta_hat(j,:), rss_N(j)]=fminsearch(@lsq2, theta_0, [], data); 
   %%%% visualize the fit
   xx=linspace(0,max(x));
   yy=theta_hat(j,1)*(1-exp(-theta_hat(j,2)*xx));
   figure(1)
   hold on
   plot(xx,yy);
   xlabel('x'); ylabel('y=\theta_1(1-exp (\theta_2 x))');
   hold on
end

figure(2)
hold on
plot(theta_hat(:,1),theta_hat(:,2),'b.','MarkerSize',2); hold on;

figure(3)
hist(theta_hat(:,1),50)%hist of theta1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

figure(4)
hist(theta_hat(:,2),50)%hist of theta2
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%% just to remark the initial fit
figure(1)
hold on
plot(xx1,yy1,'b.-','MarkerSize',10);
plot(x,y,'k^','MarkerSize',10);
xlabel('x'); ylabel('y=\theta_1(1-exp (\theta_2 x))');
hold on
