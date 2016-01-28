ref_img = imread('ex21a.tif');%get reference image
mov_img = imread('ex21b.tif');%get rotated image

%get 1d
J=mov_img(:,:,1);
% imshow(J)
%get control points by using 
cpselect(ref_img,J);
%  fixedPoints  = [11 11; 41 71];
%  movingPoints = [14 44; 70 81];

% affine transfromation
tform1 = fitgeotrans(cpstruct.basePoints,cpstruct.inputPoints,'affine');
J_affine = imwarp(J,tform1,'OutputView',imref2d(size(ref_img)));

% Nonreflective similarity
tform2 = fitgeotrans(cpstruct.basePoints,cpstruct.inputPoints,'nonreflectivesimilarity');
J_nonref = imwarp(J,tform2,'OutputView',imref2d(size(ref_img)));

% Projective transformation
tform3 = fitgeotrans(cpstruct.basePoints,cpstruct.inputPoints,'projective');
J_projec = imwarp(J,tform3,'OutputView',imref2d(size(ref_img)));

% Similarity
tform4 = fitgeotrans(cpstruct.basePoints,cpstruct.inputPoints,'similarity');
J_sim = imwarp(J,tform4,'OutputView',imref2d(size(ref_img)));

% Jregistered = imwarp(J,tform,'OutputView',imref2d(size(ref_img)));
% imshow(Jregistered)
% 
% falsecolorOverlay = imfuse(ref_img,Jregistered);
% figure
% imshow(falsecolorOverlay,'InitialMagnification','fit');

figure
subplot(1,5,1)
imshow(J)
title('Original');

subplot(1,5,2)
imshow(J_affine)
title('Affine');

subplot(1,5,3)
imshow(J_nonref)
title('Nonref')

subplot(1,5,4)
imshow(J_projec)
title('Projec')

subplot(1,5,5)
imshow(J_sim)
title('Sim')

