%% Radial distortion

I = rgb2gray( double( imread( 'office_5.jpg' ) ) ./ 255 );

% pixel spatial locations
[X Y] = meshgrid( 1:size(I,2), 1:size(I,1) );

% pixel spatial locations in polar coordinates
[th r] = cart2pol( X-size(I,2)/2, Y-size(I,1)/2 );

% barrel distortion
k = 1e-6;
% pincushion distortion
%k = -1e-6;

% distorted r
rd = r.* (1 + k*r.^2 );

% distorted coordinates in cartesian space
[Xd Yd] = pol2cart( th, rd );
Xd = Xd + size(I,2)/2;
Yd = Yd + size(I,1)/2;

% interpolate the values for the new pixel positions
Id = interp2( X, Y, I, Xd, Yd, 'cubic' );

imshow(Id)
