% Task 3 k-means
%load the data
load('irisdata.mat')
%normalize data
data1=transpose(traindata);
% normalize data
X=data1;
m=mean(X);
X=X-repmat(m,size(X,1),1);
tr_data=X;
%k=2
 subplot(2,2,1),plotdata(tr_data,2);
 subplot(2,2,2),plotdata(tr_data,2);
 subplot(2,2,3),plotdata(tr_data,2);
 subplot(2,2,4),plotdata(tr_data,2);
   
  
%k=3
 subplot(2,2,1),plotdata(tr_data,3);
 subplot(2,2,2),plotdata(tr_data,3);
 subplot(2,2,3),plotdata(tr_data,3);
 subplot(2,2,4),plotdata(tr_data,3);
% plotdata(tr_data,3);
%k=5
for i=1:8
    subplot(2,4,i),plotdata(tr_data,5);
end
% subplot(2,3,1),plotdata(tr_data,5);
%  subplot(2,3,2),plotdata(tr_data,5);
%  subplot(2,3,3),plotdata(tr_data,5);
%  subplot(2,3,4),plotdata(tr_data,5);
%  subplot(2,3,3),plotdata(tr_data,5);
%  subplot(2,3,4),plotdata(tr_data,5);
%plotdata(tr_data,5);
%k=7
subplot(2,2,1),plotdata(tr_data,7);
subplot(2,2,2),plotdata(tr_data,7);
subplot(2,2,3),plotdata(tr_data,7);
subplot(2,2,4),plotdata(tr_data,7);
%plotdata(tr_data,7);
