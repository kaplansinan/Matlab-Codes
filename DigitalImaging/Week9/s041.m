%% Uneven illumination fields (linear)

%I = double( imread('football.jpg') )./255;
%I = double( imread('office_5.jpg') ) ./255;
I = double( imread('saturn.png') )./255;

[X Y] = meshgrid( 1:size(I,2), 1:size(I,1) );

p = 1.15e-3;

f = (X+Y).*p;

subplot(1,3,1)
imshow(I)
title('Original image')
subplot(1,3,2)
imshow(f,[])
title('Linear illumination field')
subplot(1,3,3)
imshow( I.*repmat(f,1,1,3) )
title('I .* f')

%% Uneven illumination fields (radial)

%I = double( imread('football.jpg') )./255;
I = double( imread('saturn.png') )./255;

[X Y] = meshgrid( 1:size(I,2), 1:size(I,1) );

p = 0.0015;

r = ( sqrt( (X-size(I,2)/2).^2 + (Y-size(I,1)/2).^2 ) );
f = exp(-(p*r).^2);

subplot(1,3,1)
imshow(I)
title('Original image')
subplot(1,3,2)
imshow(f,[])
title('Radial illumination field')
subplot(1,3,3)
imshow( I.*repmat(f,1,1,3) )
title('I .* f')
