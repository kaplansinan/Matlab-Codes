load irisdata

[M, N] = size(traindata);
nclass = max(trainclass);
% nTrees = [10 100 1000];
nTrees = [10 100];
subsetProp = 0.15;

for caseInd = 1:length(nTrees)
  cumVote = zeros(nclass, N);
  for treeInd = 1:nTrees(caseInd)
    sampleInds = ceil(N * rand(1, N));
    sampleInds = sampleInds(1:floor(subsetProp * N));
    tdata = traindata(:, sampleInds);
    tclass = trainclass(sampleInds);

    T = classregtree(tdata', tclass', 'method', 'classification', ...
      'prune', 'off', 'splitcriterion', 'gdi');
    cClass = eval(T, data');
    
    vote = zeros(nclass, N);
    for cInd = 1:N
      vote(str2double(cClass{cInd}), cInd) = 1;
    end
    cumVote = cumVote + vote;
  end
  [tmp, class] = max(cumVote);
  correct(caseInd) = sum(class == dataclass);
  fprintf('Classification accuracy with %d trees: %.1f %%\n', ...
    nTrees(caseInd), 100 * (correct(caseInd) / length(class)));
end
