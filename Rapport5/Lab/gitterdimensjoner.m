close all
clear

%Displaying and reading image
imshow('bilde1_gitter_20x.jpg')
bilde20x = imread('bilde1_gitter_20x.jpg');

%Determining the number of pixels in each direction
Nx = size(bilde20x, 1);
Ny = size(bilde20x, 2);
%Putting a line in the picture to show were the intensity plot is from
line([1,1280], [154,154], 'Color', 'r', 'LineWidth', 4)

%Saving drawed line
f = getframe(gca);
im = frame2im(f);

imwrite(im, 'bilde20x.jpg')



figure(2)
plot(linspace(0,Nx,Nx), bilde20x(:,154))
ylabel('Intensitetsnivå')
xlabel('Piksler i x-retning')
set(gca, 'FontSize', 16)


