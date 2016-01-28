function C = bayes3(trainclass, traindata, data)

Sigma = [];
mu = [];
Pw = [];

classes = max(trainclass);
trainsamples = length(traindata);

for i = 1:classes
  classi = traindata(:, find(trainclass == i));
  Pw(i) = length(classi) / trainsamples; % a priori probability
  mu(:, i) = mean(classi, 2); % mean
  Sigma(:, :, i) = cov(classi'); % covariance
end

% Now that the means, covariances and priories are calculated, just
% classify by using the bayesian classifier
C = bayes1(mu, Sigma, data);
