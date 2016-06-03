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
%kraft = g*vekt*1e-3;

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

%saveas(gcf, 'tilpasning', 'epsc')

%Estimating area of cross section for the vismut rod
A = pi*(mean_D*1e-3)^2/4;
permeability = 4*pi*1e-7;

chi = -2*permeability*m/A;
dm = 0;
dChi = chi*sqrt((dm/m)^2+(2*standard_error_diameter/mean_D)^2+(2*0.05)^2); 

B1 = measurements(:,3)*1e-3;
[m2, c2, dm2, dc2] = uncertaintyLinearFitting(B1, kraft);

Force_lin2 = @(B) c2+m2*B;
figure(2)
plot(B1, kraft, '-ob')
hold on
plot(B1, Force_lin2(B1), 'r')
chi2 = -2*permeability*m2/A;

%Relativ forskjell mellom målte og lineært tilpassede verdier
relativ1 = (kraft-Force_lin(B1_squared))./kraft;
relativ2 = (kraft-Force_lin2(B1))./kraft;
figure(3)
plot(B1, relativ1*100, '-b')
hold on
plot(B1, relativ2*100, '--r')
set(gca, 'FontSize', 16)
xlabel('Magnetfeltmålinger [T]')
ylabel('Relativ forskjell i %')
legend('F_z og B_1^2', 'F_z og B_1', 'Location', 'southeast')

%saveas(gcf, 'relativForskjell', 'epsc')
rms1 = sum(((kraft-Force_lin(B1_squared))-...
    mean(kraft-Force_lin(B1_squared))).^2)/length(kraft);
rms2 = sum(((kraft-Force_lin2(B1))-...
    mean(kraft-Force_lin2(B1))).^2)/length(kraft);