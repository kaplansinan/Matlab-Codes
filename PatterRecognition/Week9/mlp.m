function [testclass,t,whidden,woutput]=mlp(traindata,trainclass,testdata)

N=size(traindata,2);
d=size(traindata,1);
classes=max(trainclass);

maxepochs=100000;

J=zeros(1,maxepochs);

rho=0.0001;

hidden=3; % number of hidden layer neurons

trainoutput=zeros(classes,N);
for i=1:N,
  trainoutput(trainclass(i),i)=1;
end

extendedinput=[traindata;ones(1,N)];

whidden=(rand(d+1,hidden)-0.5)/10;

woutput=(rand(hidden+1,classes)-0.5)/10;

t=0;
J=inf;
while 1
  t=t+1;
  
  vhidden=whidden'*extendedinput;
  yhidden=tanh(vhidden);

  yhidden=[yhidden;ones(1,N)];

  voutput=woutput'*yhidden;
  youtput=voutput;
  
  
  J(t)=0.5*sum(sum((youtput-trainoutput).^2));

  if (mod(t,100)==0)
    semilogy(1:t,J(1:t));
    t
    drawnow;
  end
  
  if (J(t)<1e-12)
    break;
  end;
  
  if (t>maxepochs) 
    break;
  end
  
  if t > 1
      if abs(J(t)-J(t-1)) < 1e-12
       break;
      end
  end
  
  deltaoutput=(youtput-trainoutput);
  
  deltahidden=(woutput(1:end-1,:)*deltaoutput).*(1-yhidden(1:end-1,:).^2);
  
  deltawhidden=-rho*extendedinput*deltahidden';
  deltawoutput=-rho*yhidden*deltaoutput';
  woutput=woutput+deltawoutput;
  whidden=whidden+deltawhidden;
end

extendedinput=[testdata;ones(1,size(testdata,2))];

vhidden=whidden'*extendedinput;
yhidden=tanh(vhidden);

yhidden=[yhidden;ones(1,N)];

voutput=woutput'*yhidden;
youtput=voutput;

[tmp,testclass]=max(youtput,[],1);

