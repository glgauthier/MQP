% Camera data read through use of AL422B FIFO, arduino, and PuTTy logging
clear all;
%close all;
fid = fopen('rewiredFSM.log','r');
image = zeros(480,752);
XPOS = 1;
YPOS = 1;
LINENUM = 1;
ERRNUM = 0;
h = waitbar(0,'Parsing image...');
while 1
  c = fgetl(fid);
  if ~ischar(c), break, end
  if length(c) > 0
      image(YPOS,XPOS) = str2num(c)/255;
  else
      ERRNUM = ERRNUM + 1;
      sprintf('Error #%d: Line %d contains no data',ERRNUM,LINENUM)
  end
  if XPOS<752
      XPOS = XPOS + 1;
  else
      XPOS = 1;
      YPOS = YPOS + 1;
  end
  if mod(LINENUM,15000)==0
    waitbar(LINENUM /360000);
  end
  LINENUM = LINENUM + 1; % current line in file (for debug)
end
fclose(fid);
close(h) 
figure
imshow(image);