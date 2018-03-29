figure;
for i = 1:200
    [img, bw] = snapshot(cam), 40);
    subplot(2, 1, 1);
    imagesc(img);
    subplot(2, 1, 2);
    imagesc(bw);
    drawnow;
end