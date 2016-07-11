clear all
camera = serial('COM36', 'BaudRate', 9600,'ByteOrder','bigEndian','InputBufferSize',32);%,'FlowControl','software');
fopen(camera)
data = fread(camera)
fclose(camera)