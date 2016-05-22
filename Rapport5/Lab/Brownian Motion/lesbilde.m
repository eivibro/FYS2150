close
I = imread('Threshold_20X.jpg');

figure
imagesc(I)
colorbar

threshold = 140;
Ibw = im2bw(I,threshold);
figure(2)
imagesc(Ibw)