clear 
%close all

load faradayFluks.mat

n = 130; %rotations secondary spool
N = 344; %rotations primary spool
L = 335e-3; %Length primary inductance
d = 6.5e-3; %Diameter secondary inductance
mu_0 = 4*pi*1e-7; %Tm/A
k = 0.98e-6; %microweber (calibration constant)
dempningskonstant = 10;   %adjustment on integrator
kappa = k*dempningskonstant; 


A = pi*d^2/4;
dS = (integrator(:,3));  %integrator value
I = integrator(:,1)


dB = abs(kappa*dS/(n*A));
B = dB/2;

plot(I, B, '-ob')
xlabel('Strøm [A]')
ylabel('Magnetisk flukstetthet [T]')
set(gca, 'FontSize', 18)

%saveas(gcf, 'bavi', 'epsc')
B2permu = [-B/mu_0; 0; flipud(B/mu_0)];
I2 = [integrator(:,2); 0; flipud(I)];
H0 = I2*N/L;
B0 = H0*mu_0;
M = B2permu-H0;
figure(2)
plot(H0, M, '-ob')
ylabel('M fra målte verdier [A/m]')
xlabel('H_0 fra utregnede verdier [A/m]')

set(gca, 'FontSize', 16)
figure(2)
plot(B./B0(1:8))
%saveas(gcf, 'magnetisering', 'epsc')