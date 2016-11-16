%% Initialize variables and data %%
Y = [0.01 2.4 11.03 4.03 0.24 0.02]'; % response(Y)
X = [1 3 5 7 9 11]'; %design data X

n = length(Y); % number of data points

b_0 = [1 0.1 0.9]; % initial quess for the optimizer

% constructing the design matrix
X2 = [ones(n,1) X  X.^2];
data = [X, X.^2,Y]; % data matrix
%% fit the quadratic model first %%
b = X2\Y; % LSQ fit
%% check quality of the fit %%
% estimating the covariance
sig = std(Y); % sigma estimate
cov_b = sig^2 * inv(X2'*X2);
% t-values
std_b = sqrt(diag(cov_b));
t_b = b./std_b;
% R2 value
yfit = X2*b; % model response
R2 = 1-sum((Y-yfit).^2)/sum((Y-mean(Y)).^2)

% visualizing the fit
plot(1:n,Y,'o',1:n,yfit); title('model fit');

%% fit the model with log tranform %%
b_log = X2\log(Y); % LSQ fit
y_logfit = X2*b_log; % model response

%% check quality of the fit %%
% estimating the covariance
siglog = std(log(Y)); % sigma estimate
cov_b_log = siglog^2 * inv(X2'*X2);
% t-values
std_blog = sqrt(diag(cov_b_log));
t_blog = b_log./std_blog;
% R2 value
R2log = 1-sum((log(Y)-y_logfit).^2)/sum((log(Y)-mean(log(Y))).^2)
plot(1:n,Y,'o',1:n,yfit,1:n,y_logfit);

%% fit model with fminsearch %%
%%%% Get estimate for sigma**2 from the residual Sum of Squares
[bmin,ssmin]=fminsearch(@non_linear_log,b_0,[],data);

Y_nonlin = bmin(1)+bmin(2)*X+bmin(3)*(X.^2);
plot(1:n,Y,'o',1:n,yfit,'-g',1:n,y_logfit, 1:n,Y_nonlin,'*r');
legend('Data','LSQ fit','log fit','fminsearch')
% %%%% Compute the Jacobian analytically
% J = [1-exp(-bmin(2).*X),X.*bmin(1).*exp(-X.*bmin(2))];
% %%%% Compute the covariance and print the parameter estimates
% sigma2 = ssmin/(n-2); % std of measurument noise estimated by the residuals
% C = sigma2*inv(J’*J);
% disp(’(theta, std, t-values):’);
% [bmin(:) sqrt(diag(C)) bmin(:)./sqrt(diag(C))]
% %%%% visualize the fit
% xx=linspace(0,10);
% yy=bmin(1)*(1-exp(-bmin(2)*xx));
% plot(xx,yy,x,y,’ro’);
% xlabel(’x’); ylabel(’y=\theta_1(1-exp (\theta_2 x))’);
