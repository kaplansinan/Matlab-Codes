% 1 - get image
    img = imread('ex23a.tif');%get reference image
    imshow(img)
% 2 - Increase contrast of the image
  
  cont_1 = imadjust(img);
  cont_2 = imadjust(cont_1,[0.3 0.7],[]);
  % show different contrast of image
    figure
    subplot(1,3,1)
    imshow(img)
    title('Original');

    subplot(1,3,2)
    imshow(cont_1)
    title('Cont 1');

    subplot(1,3,3)
    imshow(cont_2)
    title('Cont 2')
% 3- Determine the probability of an Intensity Value
   
%     [M N] = size(img); %get size of image
%     numPix = M*N;  %num of pixels
%     [count, bins] = imhist(img); % count number of each intensity value
%     prob = count/numPix; % compute the probability of each intensity value

    %get probability of each intensity values in each image
    prob_img = compute_probability(img);
    prob_cont1 = compute_probability(cont_1);
    prob_cont2 = compute_probability(cont_2);
    
   % average of pixel values in each image
    mu_img = mean2(img); 
    mu_cont1 = mean2(cont_1);
    mu_cont2 = mean2(cont_2); 
    % n-th central moment(0...4)
    moments = zeros(3,5);% create zeros array to store each moment value for each image
    for i=1:5
        %moments of original image
        moments(1,i) = computemoment(prob,mu,i-1);
        % moments of cont_1 image
        moments(2,i) = computemoment(prob_cont1,mu_cont1,i-1);
        % moments of cont_2 image
        moments(3,i) = computemoment(prob_cont2,mu_cont2,i-1);
    end
    
  % 4- Compare the results
   
   x=[1:1:5];
    figure
    plot(x,moments(1,:),'--gs',...
        'LineWidth',2,...
        'MarkerSize',10,...
        'MarkerEdgeColor','b',...
        'MarkerFaceColor',[0.5,0.5,0.5]); hold on

    plot(x,moments(2,:),'--bs',...
        'LineWidth',2,...
        'MarkerSize',10,...
        'MarkerEdgeColor','b',...
        'MarkerFaceColor',[0.5,0.5,0.5]);hold on

    plot(x,moments(3,:),'--rs',...
        'LineWidth',2,...
        'MarkerSize',10,...
        'MarkerEdgeColor','b',...
        'MarkerFaceColor',[0.5,0.5,0.5])

% reults: increase contrast increase moment values
