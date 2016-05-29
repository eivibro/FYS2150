clear
close all

%Measurements setup
load('diamagnetisme.mat')
I = (0:0.2:2.4)';
A = [I, measurements];

%Diameter vismut
mean_D = mean(diameter);
std_D = std(diameter);
standard_error_diameter = std_D/sqrt(length(diameter));

%Force vs. magnetic field
g = 9.82;
B1_squared = (measurements(:,3)*1e-3).^2;
vekt = measurements(:,1);
kraft = g*(max(vekt)-vekt)*1e-3;

[m, c, dm, dc] = uncertaintyLinearFitting(B1_squared...
    (1:length(B1_squared)), kraft(1:length(kraft)));

Force_lin = @(B_squared) c+m*B_squared;

plot(B1_squared, kraft, '-ob')
hold on
plot(B1_squared, Force_lin(B1_squared), '--r')
ylabel('Kraft [N]')
xlabel('B_1^2 [T^2]')
legend('Målinger', 'Lineær tilpasning', 'Location', 'northwest')
set(gca, 'FontSize', 16)

saveas(gcf, 'tilpasning', 'epsc')

%Estimating area of cross section for the vismut rod
A = pi*(mean_D*1e-3)^2/4;
permeability = 4*pi*1e-7;

chi = -2*permeability*m/A;
dChi = chi*sqrt((dm/m)^2+(2*standard_error_diameter/mean_D)^2+0.1^2); 
chi-dChi
