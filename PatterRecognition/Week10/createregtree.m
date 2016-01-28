function regtree = createregtree( data,class,split_crit )
%This function creates decision tree by using classregtree function
%of matlab based on given data, class and split criterion
    data=transpose(data);
    class=transpose(class);
    regtree = classregtree(data, class, 'method', 'classification',  'splitcriterion', split_crit);
end

