function M = confmatr(c1, c2)
% M = confmatr(c1, c2)
%
%   c1 - ground truth
%   c2 - classification results

c = max(c1);
M = zeros(c);

for i = 1:c,
  for j = 1:c,
    M(i, j) = sum(c1(c1 == i) == c2(c1 == j));
  end
end
