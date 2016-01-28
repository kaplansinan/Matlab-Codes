function C=bayes1(mu,Sigma,data)

c=size(mu,2); % number of classes
n=size(data,2); % number of examples

D=zeros(c,n);

for i=1:c,
  W=-1/2*inv(Sigma(:,:,i));
  w=inv(Sigma(:,:,i))*mu(:,i);
  w0=-1/2*mu(:,i)'*inv(Sigma(:,:,i))*mu(:,i)-1/2*log(det(Sigma(:,:,i)));

  for j=1:n,
    D(i,j)=data(:,j)'*W*data(:,j)+w'*data(:,j)+w0;
  end;
end;
D
[tmp C]=max(D);

