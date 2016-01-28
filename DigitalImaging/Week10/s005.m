%% Basic geometric transformations

%% a)

% point p in homogenous coordinates
p0 = [-1;-1;1];

% 3x3 homogenous transformation matrix (pure translation)
T = [1,0,2;0,1,2;0,0,1];

p = T*p0;

plot([-2 2], [0,0], 'k-')
hold on
plot([0,0],[-2 2], 'k-')

plot(p0(1),p0(2),'b.')
plot(p(1),p(2),'r.')

%% b)

% circle with r=0.5 centered at (-0.5,0.5) the x-y-values defined by the
% radius r, center c and a range of angles theta between [-pi,pi]
r = 0.5;
c = [-0.5;0.5];
theta = [-pi:0.05:pi];
x = c(1) + r*cos(theta);
y = c(2) + r*sin(theta);

% homogenous coordinates
p0 = [x(:),y(:),ones(numel(x),1)];

% transformation matrix with scaling and translation
T = [1,0,0.5;0,0.5,-0.25;0,0,1];

p = (T*p0')';

plot([-2 2], [0,0], 'k-')
hold on
plot([0,0],[-2 2], 'k-')

plot(p0(:,1),p0(:,2),'b-')
plot(p(:,1),p(:,2),'r-')

%% c)

x = linspace(-0.5,0.5)';
y = linspace(0,0.5)';

% rectangle points
p0 = [ x, ones(size(x))*0.5; ...
       ones(size(x))*0.5,y; ...
       x(end:-1:1), zeros(size(y)); ...
       ones(size(x))*-0.5,y(end:-1:1) ...      
       ];
   
% 90 degree rotation in 2D (i.e., flip x- and y-axis)
R = [0,-1;1,0];
   
% translate points to origin
p = p0 - repmat( [0,0.5], size(p0,1), 1 );

% rotate and translate back
p = (R*p')' + repmat( [0,0.5], size(p,1), 1 );

plot([-2 2], [0,0], 'k-')
hold on
plot([0,0],[-2 2], 'k-')

plot(p0(:,1),p0(:,2),'b-')
plot(p(:,1),p(:,2),'r-')

