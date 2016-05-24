close all
clear

D20X = 0.7e-6;
%Displaying and reading image
imshow('bilde1_gitter_20x.jpg')
bilde20x = imread('bilde1_gitter_20x.jpg');

%Determining the number of pixels in each direction
Ny = size(bilde20x, 1);
Nx = size(bilde20x, 2);

%Putting a lines in the picture to show where the intensity plots are from
y_coordinate = 831;
x_coordinate = 158;
line([1,Nx], [y_coordinate, y_coordinate], 'Color', 'r', 'LineWidth', 4)
line([x_coordinate, x_coordinate], [1,Ny], 'Color', 'b', 'LineWidth', 4)

%Saving drawed line in image
f = getframe(gca);
im = frame2im(f);
imwrite(im, 'bilde20x.jpg')

%Gridparametere
spacing = 0.1e-3;
linewidth = 10e-6;

%Determining the sx and sy
x1 = [504, 149];
x2 = [936, 150];

y1 = [71, 151];
y2 = [503, 148];

dx = x2(1,1)-x1(1,1);
dy = y2(1)-y1(1);

sx = spacing/dx;
sy = spacing/dy;
D20Xpersx = D20X/sx;
%Plotting the intensity for the given coordinates
fontsize = 14;
figure(2)
subplot(2,1,1)
plot(linspace(1,Nx,Nx), bilde20x(y_coordinate, :), 'r')
hold on
plot(x1(1), x1(2), 'kx', 'Markersize', 10)
plot(x2(1), x2(2), 'kx', 'Markersize', 10)
hold off
ylabel('Intensitetsnivå')
xlabel('Piksler i x-retning')
set(gca, 'FontSize', fontsize)
subplot(2,1,2)
plot(linspace(1,Ny,Ny), bilde20x(:, x_coordinate), 'b')
hold on
plot(y1(1), y1(2), 'kx', 'Markersize', 10)
plot(y2(1), y2(2), 'kx', 'Markersize', 10)
hold off
ylabel('Intensitetsnivå')
xlabel('Piksler i y-retning')
set(gca, 'FontSize', fontsize)

saveas(gcf, 'gitter20x', 'epsc')


