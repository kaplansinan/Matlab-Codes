img = imread('ex22a.tif');%get reference image
imshow(img(:,:,1))

% cpselect(img(:,:,1),img(:,:,1));
% fixedPoints  = [11 11; 41 71];
% movingPoints = [11 11; 41 71];

%scaling factor
xform = [ 1.5  0  0
          0  1.5  0
          0  0  1 ];

tform_translate = maketform('affine',xform);
[cb_trans xdata ydata]= imtransform(img, tform_translate,'nearest');
[cb_trans1 xdata1 ydata1]= imtransform(img, tform_translate,'bilinear');

figure
subplot(1,3,1)
imshow(img(:,:,1))
title('Original');

subplot(1,3,2)
imshow(cb_trans(:,:,1))
title('Nearest');

subplot(1,3,3)
imshow(cb_trans1(:,:,1))
title('Bilinear')

% imshow(cb_trans1(:,:,1))

% tform = fitgeotrans(fixedPoints,movingPoints,'nonreflectivesimilarity')
% D = imwarp(img,tform_translate,'nearest');
% D1 = imwarp(img,tform,'bilinear');
% 
% K = imtransform(img,tform,'bilinear');
% imshow(D(:,:,1))



