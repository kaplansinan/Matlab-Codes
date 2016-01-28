function testclass = svm2(traindata, trainclass, testdata, C)
% function testclass = svm2(traindata, trainclass, testdata, C)
% 
% Non-linear support vector machine
% Type of kernel is determined by function Kern(x, y)
% which must be found in Matlab search path.

X = traindata;
y = trainclass';

y(y == 2) = -1;

N = size(X, 2)

H = zeros(N);

% calculate H
for ii = 1:N
  for jj = 1:N
    H(ii, jj) = y(ii)*y(jj)*Kern(X(:, ii), X(:, jj));
  end
end

f = -ones(N, 1);
Aeq = y';
beq = 0;
LB = zeros(N, 1);
UB = C*ones(N, 1);

lambda = quadprog(H, f, [], [], Aeq, beq, LB, UB);

classAsvi = find( abs(lambda) > 1e-6 & y == 1)
classBsvi = find( abs(lambda) > 1e-6 & y == -1)

SVs = abs(lambda)>1e-6;

for i = 1:size(testdata, 2)
  s = 0;
  for k = 1:N
    s = s + lambda(k) * y(k) * ...
      Kern(traindata(:, k), testdata(:, i)) - ...
      lambda(k) * y(k) * ...
      Kern(traindata(:, k), traindata(:, classAsvi(1)));
  end
  
  testclass(i) = sign(1 + s);
end
