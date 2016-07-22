% Camera data read through use of AL422B FIFO, arduino, and PuTTy logging
clear all;
close all;
FILENAME =  uigetfile('*.log','multiselect','off');
fprintf('File %s selected\n\r',FILENAME);
fid = fopen(FILENAME,'r');
image = zeros(480,752);
XPOS = 1;
YPOS = 1;
LINENUM = 1;
ERRNUM = 0;
h = waitbar(0,'Parsing image...');
c = fgetl(fid); %get rid of 1st line
while 1
  c = fgetl(fid);
  if ~ischar(c), break, end
  if length(c) > 0
      image(YPOS,XPOS) = str2num(c)/255;
  else
      ERRNUM = ERRNUM + 1;
      fprintf('Error #%d: Line %d contains no data\n\r',ERRNUM,LINENUM)
  end
  if XPOS<752
      XPOS = XPOS + 1;
  else
      XPOS = 1;
      YPOS = YPOS + 1;
  end
  if mod(LINENUM,36096)==0
    waitbar(LINENUM /360000);
  end
  LINENUM = LINENUM + 1; % current line in file (for debug)
end

figure
imshow(image);

%save the image to a file, overwrite if already saved
[path,name,ext] = fileparts(FILENAME);
imgname = strcat(name,'.png');
if (exist(imgname, 'file') == 2)
    fprintf('File for image already exists... overwriting it\n\r')
    delete(imgname);
end
% change to eps for vector image
saveas(gcf,imgname);
fprintf('Saved figure to image %s\n\r',imgname);

fclose(fid);
close(h) 
