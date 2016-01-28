% Task 3
x1=[0;0]; x2=[0;1]; x3=[2;1]; x4=[2;0]; x5=[1;10]; % data points
dat_vec=[x1 x2 x3 x4 x5]; % data vector consists of all data points
min_vec=min(dat_vec); % this vector contains  minimum value of each column in data vector
max_vec=max(dat_vec); % this vector contains  maximum value of each column in data vector
mean_vec=mean(dat_vec); % this vector contains mean of each column in data vector
var_vec=var(dat_vec); % this vector contains variance of each column in data vector

%min-max scaling 
[r,c] = size(dat_vec); % get size of data matrix
min_max_scal=zeros(c);
min_max_scal=zeros(1,c);
 min_max_scal=zeros(r,c);
for i=1:r 
      for j=1:c
          min_max_scal(i,j)=[dat_vec(i,j)-min_vec(j)]/[max_vec(j)-min_vec(j)];
      end
   end

% mean_var scaling 
mean_var_scaling=zeros(r,c);
for i=1:r 
     for j=1:c
        mean_var_scaling(i,j)=[dat_vec(i,j)-mean_vec(j)]/sqrt(var_vec(j));
     end
end
% soft max scaling
soft_max_scaling=zeros(r,c);
for i=1:r 
      for j=1:c
          soft_max_scaling(i,j)=1/[1+exp(-mean_var_scaling(i,j))]; 
      end
  end 