%define range of x-axis
X=[1:0.1:10];
%normpdf of feature 1 for both classes
plot(normpdf(X,3,2),'color','r'); hold on;
plot(normpdf(X,7,1),'color','b');

%normpdf of feature 2 for both classes
plot(normpdf(X,5,0.2),'color','r'); hold on;
plot(normpdf(X,6,0.2),'color','b');