close all
clear


%Displaying and reading image
imshow('bilde2_gitter_40x.jpg')
bilde = imread('bilde2_gitter_40x.jpg');
D40X = 0.4e-6;
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

%Gridparametere
spacing = 0.05e-3;
linewidth = 5e-6;

%Determining the sx and sy
x1 = [190, 162; 190, 162];
x2 = [620, 155; 620, 162];

y1 = [77, 146];
y2 = [507, 146];

dx = x2(1,1)-x1(1,1);
dy = y2(1)-y1(1);

sx = spacing/dx;
sy = spacing/dy;
D40Xpersx = D40X/sx;
%Plotting the intensity for the given coordinates
fontsize = 14;
figure(2)
subplot(2,1,1)
plot(linspace(1,Nx,Nx), bilde(y_coordinate, :), 'r')
hold on
plot(x1(1,1), x1(1,2), 'kx', 'Markersize', 10)
plot(x2(1,1), x2(1,2), 'kx', 'Markersize', 10)
hold off
ylabel('Intensitetsnivå')
xlabel('Piksler i x-retning')
set(gca, 'FontSize', fontsize)
subplot(2,1,2)
plot(linspace(1,Ny,Ny), bilde(:, x_coordinate), 'b')
hold on
plot(y1(1), y1(2), 'kx', 'Markersize', 10)
plot(y2(1), y2(2), 'kx', 'Markersize', 10)
hold off
ylabel('Intensitetsnivå')
xlabel('Piksler i y-retning')
set(gca, 'FontSize', fontsize)

saveas(gcf, 'gitter40x', 'epsc')




