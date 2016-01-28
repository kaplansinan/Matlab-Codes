% How many trees do you want in the forest? 
k=1000;
%stores  class information from each random forest trees
classes=zeros(k,size(data,2));
%test data
testdata=transpose(data);
for i=1:k
    %y-> new data set
    %idx-> Vector of indices indicating which elements datasample chose from data to create y
    %[y idx] =createsubset( traindata,max(trainclass));
    %calculate number of samples which will be in subset
    %15<=ns<=total number of samples in data
    ns=randi([15 size(traindata,2)+1]);
    
    [y,idx] = datasample(transpose(traindata),ns);
    tree_class=trainclass(idx);
    tree_class=transpose(tree_class);
    %apply classregtree
    mytree_gdi = classregtree(y, tree_class, 'method', 'classification',  'splitcriterion', 'gdi');
    %classify test data
    [y_est, node, labels] = eval(mytree_gdi, testdata);
    matdata=str2double(y_est);
    classes(i,:)=transpose(matdata);
end

M = mode(classes);
errors=sum(M~=dataclass)


