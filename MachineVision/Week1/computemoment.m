function z = computemoment( prob, mu, n)
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
z=0;
    for i=1:256
        z = z + ((i - mu).^n)* prob(i,1);
    end
    
end

