function prob = compute_probability( img)
%UNTITLED6 Summary of this function goes here
%   Detailed explanation goes here
    [M N] = size(img); %get size of image
    numPix = M*N;  %num of pixels
    [count, bins] = imhist(img); % count number of each intensity value
    prob = count/numPix; % compute the probability of each intensity value

end

