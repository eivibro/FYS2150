close all
clear

%20X:
%Displaying and reading image
imshow('bilde2_gitter_40x.jpg')
bilde = imread('bilde2_gitter_40x.jpg');

%Determining the number of pixels in each direction
Ny = size(bilde, 1);
Nx = size(bilde, 2);

%Putting a lines in the picture to show where the intensity plots are from
y_coordinate = 712;
x_coordinate = 677;
line([1,Nx], [y_coordinate, y_coordinate], 'Color', 'r', 'LineWidth', 4)
line([x_coordinate, x_coordinate], [1,Ny], 'Color', 'b', 'LineWidth', 4)

%Saving drawed line in image
f = getframe(gca);
im = frame2im(f);
imwrite(im, 'bilde40x.jpg')

%Plotting the intensity for the given coordinates
fontsize = 14;
figure(2)
subplot(2,1,1)
plot(linspace(0,Nx,Nx), bilde(y_coordinate, :), 'r')
ylabel('Intensitetsnivå')
xlabel('Piksler i x-retning')
set(gca, 'FontSize', fontsize)
subplot(2,1,2)
plot(linspace(0,Ny,Ny), bilde(:, x_coordinate), 'b')
ylabel('Intensitetsnivå')
xlabel('Piksler i y-retning')
set(gca, 'FontSize', fontsize)

saveas(gcf, 'gitter40x', 'epsc')


