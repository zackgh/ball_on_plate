%% Tracking Green Ball with webcam 
% Zack Ghalayini 
% February 3, 2018 
clear
clc


%% Get webcam 
cam  = webcam(1);
% display images captured from webcam 
for i = 1:25
    img = snapshot(cam);
    imagesc(img);
    drawnow;
end

% Make 2\3 2d plots rgb
imagesc(img);
r = img(:, :, 1);
g = img(:, :, 2);
b = img(:, :, 3);

justGreen =g - r/2 - b/2;

bw = justGreen > 40;
imagesc(bw);

% Find center 
[x, y] = find(bw);
if ~isempty(x) && ~isempty(y)
    xm = round(mean(x));
    ym = round(mean(y));
    xx = max(1, xm-5):min(xm+5, size(bw, 1));
    yy = max(1, ym-5):min(ym+5, size(bw, 2));
    bwbw = zeros(size(bw), 'uint8')
    bwbw(xx, yy) = 255;
end
% Plot center and color 
imagesc(justGreen + bwbw);

