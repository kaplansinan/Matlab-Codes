function [Wi wi wio] = quaddecbound(mu,sigma)
%This function calculates the quadratic function of  
%give mean(mu) and covariances(sigma)
    Wi=(-1/2)*inv(sigma);
    wi=inv(sigma)*mu;
    ln = @(x)(log(x));
    wio=(-1/2)*transpose(mu)*inv(sigma)*mu-(1/2)*ln(det(sigma));
end

