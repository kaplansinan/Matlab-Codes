%% Basic camera model

f = 1;
O = [0;0];

s = [1;1];
c = [0;0];

% homogenous intrinsic camera matrix
K = [ [-f/s(1),0,c(1); 0,-f/s(2),c(2); 0,0,1], [0;0;1] ];

% rotation (transformation to right-handed coordinate system)
R = [1,0,0;0,1,0;0,0,-1];
% translation
t = [O(1);O(2);0];

% homogenous extrinsic camera matrix
P = [R,t;0,0,0,1];
    
%% a)

p = [[0,0,3;1,0,3;1,1,3;0,0,3],ones(4,1)];

% projection onto image plane
p_ = (K*P*p')';

p_ = p_(:,1:2)./repmat(p_(:,3),1,2);

plot3(p(:,1),p(:,2),p(:,3),'ko')
hold on
plot(p_(:,1),p_(:,2),'kx')

%% b)

p = [[0,1,3;1,1,3;1,4,3;0,1,4],ones(4,1)];

% projection onto image plane
p_ = (K*P*p')';
p_ = p_(:,1:2)./repmat(p_(:,3),1,2);

plot3(p(:,1),p(:,2),p(:,3),'ro')
hold on
plot(p_(:,1),p_(:,2),'rx')
