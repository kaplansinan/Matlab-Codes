function ss = lsq2(theta, data)
x = data(:,1);
y = data(:,2);

ss = sum((y - theta(1)*(1-exp(-theta(2)*x))).^2);
end