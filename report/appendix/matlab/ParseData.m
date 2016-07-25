% Camera data parser - reads .log files from PuTTy for MT9V034 test
% Created by Georges Gauthier - 20 July 2016
clear all;
close all;

% prompt for a logfile; open selected file for reading
FILENAME =  uigetfile('*.log','multiselect','off'); 
fprintf('File %s selected\n\r',FILENAME);
fid = fopen(FILENAME,'r');

image = zeros(480,752); % empty matrix that will hold final image
XPOS = 1; % current pixel X position
YPOS = 1; % current pixel Y position
LINENUM = 1; % number of pixels iterated through
ERRNUM = 0; % number of invalid pixels (happens when Tx is set too fast)

h = waitbar(0,'Parsing image...'); % show a loading bar
c = fgetl(fid); % get rid of 1st line

while 1 % iterate through the log file
  c = fgetl(fid); % get the next line of the file
  if ~ischar(c), break, end
  if length(c) > 0 % if the given line contains valid data...
      image(YPOS,XPOS) = str2num(c)/255; % ... store it as a pixel val
  else % otherwise, throw an error
      ERRNUM = ERRNUM + 1;
      fprintf('Error #%d: Line %d contains no data\n\r',ERRNUM,LINENUM)
  end
  if XPOS<752 % update pixel x position
      XPOS = XPOS + 1;
  else % update pixel y position
      XPOS = 1;
      YPOS = YPOS + 1;
  end
  if mod(LINENUM,36096)==0 % update the loading bar every so often
    waitbar(LINENUM /360000);
  end
  LINENUM = LINENUM + 1; % current line in file (for debug)
end

% display the image... 
figure, imshow(image);
% ... also save the image to a file, overwrite if already saved
[path,name,ext] = fileparts(FILENAME);
imgname = strcat(name,'.png');
if (exist(imgname, 'file') == 2)
    fprintf('File for image already exists... overwriting it\n\r')
    delete(imgname);
end
saveas(gcf,imgname);
fprintf('Saved figure to image %s\n\r',imgname);

% close the file and waitbar before exit
fclose(fid); 
close(h) 
