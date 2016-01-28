%% Additive and multiplicative noise

I = double( imread('cameraman.tif') )./255;
%I = double( imread('football.jpg') )./255;

subplot(2,3,1)
imshow(I)
title( 'Original image', 'interpreter','latex')
subplot(2,3,2)
imshow( imnoise(I, 'gaussian', 0, 0.01 ) )
title('Gaussian noise with $\sigma = 0.01$','interpreter','latex')
subplot(2,3,3)
imshow( imnoise(I, 'gaussian', 0, 0.1 ) )
title('Gaussian noise with $\sigma = 0.1$','interpreter','latex')
subplot(2,3,4)
imshow( imnoise(I, 'speckle', 0.01 ) )
title('Speckle noise with $\sigma = 0.01$','interpreter','latex')
subplot(2,3,5)
imshow( imnoise(I, 'speckle', 0.1 ) )
title('Speckle noise with $\sigma = 0.1$','interpreter','latex')
