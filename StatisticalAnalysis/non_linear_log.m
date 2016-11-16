function ss = non_linear_log( theta,data )
%NON_LINEAR_LOG Summary of this function goes here
%   Detailed explanation goes here
    x = data(:,1);
    x2 = data(:,2);
    y = data(:,3);
    ss = sum((y -(theta(1)+theta(2)*x+theta(3)*x2)).^2);

end
