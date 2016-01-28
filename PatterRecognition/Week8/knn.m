function C = knn( traindata,trainclass,data,k )
%Implementation of KNN for classification 
    C=[];
    % 1--> Divide the traindata set into subsets
    data_class1=traindata(1:4,trainclass==1);
    data_class2=traindata(1:4,trainclass==2);
    data_class3=traindata(1:4,trainclass==3);
    
    %2--> parameter  settings
    numClass1=size(data_class1,2);
    numClass2=size(data_class2,2);
    numClass3=size(data_class3,2);
    totalSample=numClass1+numClass2+numClass3;
    
    %3--> combine all samples together class by class
    combinedSamples = [data_class1 data_class2 data_class3];
    trueClass = transpose([zeros(numClass1,1)+1;zeros(numClass2,1)+2;zeros(numClass3,1)+3;]);
    
    %4--> calculate the class of each sample in the give data set to be
    %classified
    for i=1:length(data)
        testMatrix = repmat(data(1:4,i),1,totalSample);
        absDiff = abs(combinedSamples-testMatrix);
        absDiff = absDiff.^2;
        dist = sum(absDiff);
        [Y,I] = sort(dist);
        neighborsInd = I(1:k);
        neighbors = trueClass(neighborsInd);
        cl1 = find(neighbors == 1);
        cl2 = find(neighbors == 2);
        cl3 = find(neighbors == 3);
        joint = [size(cl1,2);size(cl2,2);size(cl3,2)];
        [value class] = max(joint);
        C(i)=class;
    end
    
end

