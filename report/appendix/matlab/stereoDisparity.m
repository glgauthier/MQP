% The following code was adapted from a Mathworks example available here:
% http://www.mathworks.com/help/vision/examples/stereo-vision.html
%
% Original Revision by Chris McCormick
% http://mccormickml.com/2014/01/10/stereo-vision-tutorial-part-i/ 
%
% Modified by Georges Gauthier - glgauthier@wpi.edu
%
% This script will compute the disparity map for the image 'right.png' by
% correlating it to 'left.png' using basic block matching

clear all;
close all;

% Set to 1 to use 'Cones' Dataset
% Set to 0 to use your own image data (lines 26-29)
EXAMPLE_DATA = 1;

% Load the stereo images.
if (EXAMPLE_DATA == 0)
    load('I1Rect.mat');
    leftI = I1Rect;
    load('I2Rect.mat');
    rightI = I2Rect;
else
    left = imread('left.png');
    right = imread('right.png');
    leftI = mean(left, 3);
    rightI = mean(right, 3);
end

% DbasicSubpixel will hold the result of the block matching. 
DbasicSubpixel = zeros(size(leftI), 'single');

% The disparity range defines how many pixels away from the block's location
% in the first image to search for a matching block in the other image.
% 50 appears to be a good value for the 450x375 images from the "Cones" 
% dataset.
disparityRange = 50;

% Define the size of the blocks for block matching.
halfBlockSize = 5;
blockSize = 2 * halfBlockSize + 1;

% Get the image dimensions.
[imgHeight, imgWidth] = size(leftI);

% Create a progress bar
h = waitbar(0,'Loading...');

% For each column 'm' of pixels in the image...
for (m = 1 : imgHeight)
    	
	% Set min/max row bounds for the template and blocks.
	% e.g., for the first row, minr = 1 and maxr = 4
    minr = max(1, m - halfBlockSize);
    maxr = min(imgHeight, m + halfBlockSize);
	
    % For each row 'n' of pixels in the image...
    for (n = 1 : imgWidth)
        
		% Set the min/max column bounds for the template.
		% e.g., for the first column, minc = 1 and maxc = 4
		minc = max(1, n - halfBlockSize);
        maxc = min(imgWidth, n + halfBlockSize);
        
		% Define the search boundaries as offsets from the template location.
		% Limit the search so that we don't go outside of the image. 
		% 'mind' is the the maximum number of pixels we can search to the left.
		% 'maxd' is the maximum number of pixels we can search to the right.
		%
		% In the "Cones" dataset, we only need to search to the right, so mind
		% is 0.
		%
		% For other images which require searching in both directions, set mind
		% as follows:
        %   mind = max(-disparityRange, 1 - minc);
		mind = 0; 
        maxd = min(disparityRange, imgWidth - maxc);

		% Select the block from the right image to use as the template.
        template = rightI(minr:maxr, minc:maxc);
		
		% Get the number of blocks in this search.
		numBlocks = maxd - mind + 1;
		
		% Create a vector to hold the block differences.
		blockDiffs = zeros(numBlocks, 1);
		
		% Calculate the difference between the template and each of the blocks.
		for (i = mind : maxd)
		
			% Select the block from the left image at the distance 'i'.
			block = leftI(minr:maxr, (minc + i):(maxc + i));
		
			% Compute the 1-based index of this block into the 'blockDiffs' vector.
			blockIndex = i - mind + 1;
		
			% Take the sum of absolute differences (SAD) between the template
			% and the block and store the resulting value.
			blockDiffs(blockIndex, 1) = sum(sum(abs(template - block)));
		end
		
		% Sort the SAD values to find the closest match (smallest difference).
		% Discard the sorted vector (the "~" notation), we just want the list
		% of indices.
		[temp, sortedIndeces] = sort(blockDiffs);
		
		% Get the 1-based index of the closest-matching block.
		bestMatchIndex = sortedIndeces(1, 1);
		
		% Convert the 1-based index of this block back into an offset.
		% This is the final disparity value produced by basic block matching.
		d = bestMatchIndex + mind - 1;
		
        % Store the calculated disparity value in the resultant img matrix
        DbasicSubpixel(m, n) = d;
    end

	% Update progress bar every 5th row.
	if (mod(m, 5) == 0)
        str = sprintf('  Image Row %d / %d (%.0f%%)\n', m, imgHeight, (m / imgHeight) * 100);
        waitbar(m/imgHeight,h,str)
	end
		
end

% close the progress bar
close(h);

% Display the disparity map. 
% Passing an empty matrix as the second argument tells imshow to take the
% minimum and maximum values of the data and map the data range to the 
% display colors.
figure, imshow(DbasicSubpixel, []);
axis image;
colorbar;

% Specify the minimum and maximum values in the disparity map so that the 
% values can be properly mapped into the full range of colors.
% If you have negative disparity values, this will clip them to 0.
caxis([0 disparityRange]);

% Set the title to display.
title(strcat('SAD Block Matching:  ',num2str(blockSize),'x',...
    num2str(blockSize),' Block, ',num2str(disparityRange),'px Search Range'));

% plot both images in a final output graph
figure,
if (EXAMPLE_DATA == 0)
    subplot(1,3,1), imshow(leftI)
    title('Left Input Image')
    subplot(1,3,3), imshow(rightI)
else
    subplot(1,3,1), imshow(left)
    title('Left Input Image')
    subplot(1,3,3), imshow(right)
end
title('Right Input Image')
subplot(1,3,2), imshow(DbasicSubpixel,[])
title(strcat('SAD Block Matching: ',num2str(blockSize),'x',...
    num2str(blockSize),' Block, ',num2str(disparityRange),'px Search Range'));