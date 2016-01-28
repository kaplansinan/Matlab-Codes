%% Common colour space transformations

%I = imread('saturn.png');
I = imread('office_5.jpg');

subplot(1,2,1)
imshow(I)
title( 'Original image')
subplot(1,2,2)
imshow( rgb2gray(I) )
title('Grayscale')

figure

subplot(2,2,1)
imshow(I)
title( 'Original image')
subplot(2,2,2)
imshow( I(:,:,1) )
title('Red')
subplot(2,2,3)
imshow( I(:,:,2) )
title('Green')
subplot(2,2,4)
imshow( I(:,:,3) )
title('Blue')

figure
H = rgb2hsv(I);
subplot(2,2,1)
imshow(I)
title( 'Original image')
subplot(2,2,2)
imshow( H(:,:,1) )
title('Hue')
subplot(2,2,3)
imshow( H(:,:,2) )
title('Saturation')
subplot(2,2,4)
imshow( H(:,:,3) )
title('Value (luminance)')
