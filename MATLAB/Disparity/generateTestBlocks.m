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
subplot(1,3,1), imagesc(left), title('Left Image'), axis image
subplot(1,3,2), imagesc(right), title('Right Image'), axis image

% add in resultant from test bench
resultant = [0,5,3,1,1,1,1,1,1,0,0,0,0,0,0,0,0; 0,5,3,1,1,1,1,1,1,0,0,0,0,0,0,0,0; 0,5,3,1,1,1,1,1,1,0,0,0,0,0,0,0,0; 0,5,3,1,1,1,1,1,1,0,0,0,0,0,0,0,0; 0,5,3,1,1,1,1,1,1,0,0,0,0,0,0,1,1; 4,5,3,1,1,1,1,1,1,0,0,0,0,0,0,1,1; 4,5,3,1,1,1,1,1,1,0,0,0,0,0,0,1,0];
subplot(1,3,3), imagesc(resultant), title('Test Bench Result'), axis image
% convert to format that can be read by test bench
%left = dec2base(left',2,8)
%right = dec2base(right',2,8)
 