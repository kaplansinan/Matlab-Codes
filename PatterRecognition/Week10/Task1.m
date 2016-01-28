% build the tree based on the training data
%traindata=transpose(traindata);
%trainclass=transpose(trainclass);

%split criterions
%case1 'gdi', Gini's diversity index;
%case2 'twoing',  for the twoing rule;
%case3 'deviance',for maximum deviance reduction;


%contruct tree with Gini's diversity index
%mytree_gdi = classregtree(traindata, trainclass, 'method', 'classification',  'splitcriterion', case1);

%contruct tree with the twoing rule
%mytree_twoing = classregtree(traindata, trainclass, 'method', 'classification',  'splitcriterion', 'twoing');

%contruct tree with maximum deviance reduction
%mytree_deviance=classregtree(traindata, trainclass, 'method', 'classification',  'splitcriterion', 'twoing');

load('irisdata.mat');
%split criterions
case1='gdi';
case2='twoing';
case3='deviance';
my_tree=createregtree(traindata,trainclass,case3);
view(my_tree);
%note here the class labels are contained in the cell y_est
testdata=transpose(data);
[y_est, node, labels] = eval(my_tree, testdata);
%convert cell  data to mat data
matdata=cellfun(@str2num,y_est);
%calculate the errors
errors=sum(transpose(matdata)~=dataclass)