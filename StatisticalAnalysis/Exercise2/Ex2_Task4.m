%% generate random vector X from normal distribution %%
d = 2;
X = normrnd(0,1,1,d);
I =  eye(d);

for k=1:6
    R = randn([10,10],'distributed') ;
end