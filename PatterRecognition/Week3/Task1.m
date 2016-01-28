%% Task 1%%
f1_mean=[3,7]; %mean for both classes
f1_std=[2,1]; %std for both classes
f2_mean=[5,6]; %mean for both classes
f2_std=[0.2,0.2] %std for both classes

% formula---> FDR=[(mean_C1-mean_C2)^2]/[std_C1^2+f1_std_C2^2]
%FDR  for feature 1 
FDRF1=[(f1_mean(1)- f1_mean(2))^2]/[f1_std(1)^2+f1_std(2)^2];

%FDR  for feature 2 
FDRF2=[(f2_mean(1)- f2_mean(2))^2]/[f2_std(1)^2+f2_std(2)^2];