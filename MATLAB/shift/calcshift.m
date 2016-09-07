%% Calculate shift between images using 2D FFT
clear all
close all

% load in image data
load('cam1.mat');
left = image; clear image
load('cam2.mat'); right = image; clear image

% calculate the x-y shift between the two images
[x,y] = fftShift(right,left)

% determine the X-Y size of the image
xmax =  max(length(left(1,:)));
ymax =  max(length(left(:,1)));

% create the shifted image from the right frame
shift = zeros(ymax,xmax);
shift(1:(ymax-y+1),1:(xmax-x+1)) = right(y:ymax,x:xmax);

% plot the shifted image overlaid on its counterpart
figure, imshow(left+shift)
title( ['Image Summation with XShift = ' num2str(x) 'px, YShift = ' num2str(ymax-y) 'px'] )    
axis off