%% Noise on channels (RGB)

%I = imread('saturn.png');
%I = imread('office_5.jpg');
I = imread('onion.png');

subplot(2,2,1)
imshow(I)
title('Original image')

I_ = I;
I_(:,:,1) = imnoise( I(:,:,1), 'gaussian', 0, 0.01 );
subplot(2,2,2)
imshow( I_ )
title('Gaussian $\sigma = 0.01$ on red','interpreter','latex')

I_ = I;
I_(:,:,2) = imnoise( I(:,:,2), 'gaussian', 0, 0.01 );
subplot(2,2,3)
imshow( I_ )
title('Gaussian $\sigma = 0.01$ on green','interpreter','latex')

I_ = I;
I_(:,:,3) = imnoise( I(:,:,3), 'gaussian', 0, 0.01 );
subplot(2,2,4)
imshow( I_ )
title('Gaussian $\sigma = 0.01$ on blue','interpreter','latex')

%% Noise on channels (HSV)

%I = imread('saturn.png');
%I = imread('office_5.jpg');
I = imread('onion.png');

H = rgb2hsv( I );

subplot(2,2,1)
imshow(I)
title('Original image')

H_ = H;
H_(:,:,1) = imnoise( H(:,:,1), 'gaussian', 0, 0.01 );
subplot(2,2,2)
imshow( hsv2rgb(H_) )
title('Gaussian $\sigma = 0.01$ on hue','interpreter','latex')

H_ = H;
H_(:,:,2) = imnoise( H(:,:,2), 'gaussian', 0, 0.01 );
subplot(2,2,3)
imshow( hsv2rgb(H_) )
title('Gaussian $\sigma = 0.01$ on saturation','interpreter','latex')

H_ = H;
H_(:,:,3) = imnoise( H(:,:,3), 'gaussian', 0, 0.01 );
subplot(2,2,4)
imshow( hsv2rgb(H_) )
title('Gaussian $\sigma = 0.01$ on value (luminance)','interpreter','latex')
