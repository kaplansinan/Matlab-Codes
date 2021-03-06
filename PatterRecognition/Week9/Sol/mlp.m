function [testClass, t, wHidden, wOutput] = ...
  mlp(trainData, trainClass, testData, testGT)
% function [testClass, t, wHidden, wOutput] = ...
%   mlp(trainData, trainClass, testData, testGT)

% Initialisation
N = size(trainData, 2);
d = size(trainData, 1);
nClass = max(trainClass);

maxEpochs = 10000; % max number of iterations

J = zeros(1, maxEpochs); % error function values

rho = 0.0001; % learning rate

nHidden = [1, 2, 5, 10]; % number of hidden layer neurons

trainOutput = zeros(nClass, N);
for i = 1:N
  trainOutput(trainClass(i), i) = 1;
end

extendedInput = [trainData; ones(1, N)]; % include bias

for archInd = 1:length(nHidden) % train all the architectures
  wHidden = (rand(d+1, nHidden(archInd)) - 0.5) / 10; % hidden weights
  wOutput = (rand(nHidden(archInd)+1, nClass) - 0.5) / 10; % output weights

  t = 0;
  while true % train the MLP
    t = t+1;

    vHidden = wHidden' * extendedInput; % hidden layer weighted inputs
    yHidden = tanh(vHidden); % hidden layer activation

    yHidden = [yHidden; ones(1, N)]; % hidden layer output

    vOutput = wOutput' * yHidden; % output layer weighted inputs
    yOutput = vOutput; % output layer (linear) output

    J(t) = 0.5 * sum(sum((yOutput - trainOutput) .^ 2)); % error

    if mod(t, 100) == 0 % plot the intermediate error
      semilogy(1:t, J(1:t));
      grid on;
      title(sprintf('Error up to iteration %d', t));
      drawnow
    end

    if J(t) < 1e-12 % error very small
      break
    end

    if t > maxEpochs % max number of iterations reached
      break
    end

    if t > 1
      if abs(J(t) - J(t-1)) < 1e-12 % error changed very little
        break
      end
    end

    % Computing sensitivities backwards in the network
    deltaOutput = (yOutput - trainOutput);

    deltaHidden = (wOutput(1:end-1, :) * deltaOutput) .* ...
      (1 - yHidden(1:end-1, :) .^ 2);

    deltawHidden = -rho * extendedInput * deltaHidden';
    deltawOutput = -rho * yHidden * deltaOutput';

    % Update the weights
    wOutput = wOutput + deltawOutput;
    wHidden = wHidden + deltawHidden;
  end

  % Test the MLP
  extendedInput = [testData; ones(1, size(testData, 2))];

  vHidden = wHidden'*extendedInput;
  yHidden = tanh(vHidden);

  yHidden = [yHidden; ones(1, N)];

  vOutput = wOutput' * yHidden;
  yOutput = vOutput;

  [tmp, testClass] = max(yOutput, [], 1);
  
  classCorrect = (testClass == testGT);
  classAcc(archInd) = sum(double(classCorrect)) / size(testData, 2);
end
[maxAcc, maxAccInd] = max(classAcc);
fprintf('Maximum classification accuracy %.0f with %d hidden units', ...
  100 * maxAcc, nHidden(maxAccInd));
