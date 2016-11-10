clear all
close all
%% Disparity test block generation
% Generate blank images
left = zeros(7,20);
right = zeros(7,20);
% Add a large block to the top left corner of each image (w/ offset)
left(1:5,1:5)= 255;
right(1:5,3:7)= 255;
% Add a light pixel to the bottom right corner of each image
left(6,17) = 127;
right(6,19) = 127;
% plot both images for reference
figure
subplot(1,2,1), imshow(left)
subplot(1,2,2), imshow(right)
% convert to format that can be read by test bench
left = dec2base(left',2,8)
right = dec2base(right',2,8)