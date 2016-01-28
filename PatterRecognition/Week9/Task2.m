load('data1.mat')
load('data2.mat')
load('data3.mat')
load('data4.mat')
data=data4;
class=class4;
%error=sum( mlp(data,class,data)~=class);
[testclass,t,whidden,woutput]=mlp(data,class,data);
%plotmlp(0:10,0:10,whidden,woutput);
error=sum( testclass~=class);
%2 neurons needed to solve XOR problem