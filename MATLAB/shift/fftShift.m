function [Xshift,Yshift] = fftShift(ping1,ping2)
%RETURNS: X and Y shift between the two images based on hurtos' method

% filter and zoom in on a clear part of each image (zoom and enhance!)
%f = fspecial('average',3); 
%ping1f = imfilter(ping1, f);
%ping2f = imfilter(ping2, f);
minY = 1;
maxY = 480;
minX = 1;
maxX = 752;
pingOne = ping1(minY:maxY,minX:maxX);
pingTwo = ping2(minY:maxY,minX:maxX);
figure,imshow([pingOne,pingTwo]),axis off

% Calculate the X-Y shift between the two pings using Hurtos' method

% Take the 2D fft of each image
fftOne = fft2(pingOne);
fftTwo = fft2(pingTwo);
% Take the complex conjugate of the second fft
fft2Conj = conj(fftTwo);

% Find the 2D cross power spectrum of the images...
offset = max(size(pingTwo(1,:))); %... with a DC offset included
CPS = (fftOne.*fft2Conj)./(offset+abs(fftOne.*fft2Conj));

% Find the 2D delta function corresponding to the x-y shift
%Delta = rot90(ifft2(CPS),2); %find the delta function
Delta = ifft2(CPS);
Delta = Delta./max(Delta(:)); %normalize it

%Compute the offset between the pings based on the location of the delta
[Yshift,Xshift] = find((Delta) == max((Delta(:))));

end

