%define range of x-axis
x = -3:0.01:15;
%initialize parameters
m1=3;
m2=6; 
s1=1;
s2=2;
%initialize decision boundaries
x1=-0.41;
x2=4.41;
plot(x,normpdf(x,m1,s1),'b'); hold on
plot(x,normpdf(x,m2,s2),'r');hold on
plot(x1,[0:0.01:0.5],'*'); hold on
plot(x2,[0:0.01:0.5],'*')

