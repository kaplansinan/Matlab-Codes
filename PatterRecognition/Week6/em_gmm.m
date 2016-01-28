function [mu, Sigma, P] = em_gmm(data, J)

N = size(data, 2);
l = size(data, 1);

mu = zeros(l, J); % mixture component means
Sigma = zeros(l, l, J); % mixture component covariances
P = repmat(1/J, J, 1); % mixture component prior probabilities

% Initialize with mean (with noise) and covariance
for i = 1:J
  mu(:, i) = mean(data, 2) + rand(l, 1);
  Sigma(:, :, i) = cov(data');
end

origmu = mu;

while true % iterate till the ending criterion is met
  hold off;
  plot(data(1, :), data(2, :), 'bx');
  hold on;
  plot(origmu(1, :), origmu(2, :), 'go'); drawnow
  plot(mu(1, :), mu(2, :), 'rx'); drawnow
  mu, P, Sigma
  pause(0.1);

  newmu = zeros(l, J);
  newP = zeros(J, 1);
  newSigma = zeros(l, l, J);

  for j = 1:J % for all mixture components
    pjsum = 0;
    for k = 1:N % for all training data samples
      newmu(:, j) = newmu(:, j) + ...
        pjxk(j, data(:, k), mu, Sigma, P, J) * (data(:, k));
      pjsum = pjsum + pjxk(j, data(:, k), mu, Sigma, P, J);
    end
    newmu(:, j) = newmu(:, j) / pjsum; % next mean

    for k = 1:N, 
      newSigma(:, :, j) = newSigma(:, :, j) + ...
        pjxk(j, data(:, k), mu, Sigma, P, J) *  ...
	(data(:, k) - newmu(:, j)) * (data(:, k) - newmu(:, j))';
    end
    newSigma(:, :, j) = newSigma(:, :, j) / pjsum; % next covariance
  
    newP(j) = 1 / N * pjsum; % next probability
  end

  if norm(mu - newmu) < 0.01 % ending criterion
    break
  end

  mu = newmu;

  P = newP;
  Sigma = newSigma;
end

function r = pjxk(j, xk, mu, Sigma, P, J)

px = 0;
for i = 1:J, 
  px = px + pxk(xk, mu(:, i), Sigma(:, :, i)) * P(i);
end
r = pxk(xk, mu(:, j), Sigma(:, :, j)) * P(j) / px;

function q = pxk(xk, muj, Sigmaj)

l = size(Sigmaj, 1);
%q = 1/(2 * pi)^(l/2)/sqrt(det(Sigmaj)) * ...
%  exp(-0.5 * (xk-muj)' * inv(Sigmaj) * (xk - muj));
q = mvnpdf(xk, muj, Sigmaj);
