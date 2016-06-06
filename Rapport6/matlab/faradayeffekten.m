clear
close all

load faradayEffect.mat
faradayMeasure(:,2:4) = faradayMeasure(:,2:4)-0.4;
B0 = [62, 95, 125, 153, 179]'*1e-3;
B = [-flipud(B0); 0; B0];
B_middel = B/1.5;
L = 30e-3;

theta440 = faradayMeasure(:,2);
[m440, c440, dm440, dc440] = uncertaintyLinearFitting(B_middel, theta440);
theta440_lin = @(B) c440 + m440*B;
figure(1)
plot(B_middel, theta440)
hold on
plot(B_middel, theta440_lin(B_middel), '--r')
hold off
verdet440 = m440/L;
dVerdet440m = dm440/L;

theta580 = faradayMeasure(:,3);
[m580, c580, dm580, dc580] = uncertaintyLinearFitting(B_middel, theta580);
theta580_lin = @(B) c580 + m580*B;
figure(2)
plot(B_middel, theta580)
hold on
plot(B_middel, theta580_lin(B_middel), '--r')
hold off
verdet580 = m580/L;
dVerdet580m = dm580/L;

theta595 = faradayMeasure(:,4);
[m595, c595, dm595, dc595] = uncertaintyLinearFitting(B_middel, theta595);
theta595_lin = @(B) c595 + m595*B;
figure(3)
plot(B_middel, theta595)
hold on
plot(B_middel, theta595_lin(B_middel), '--r')
verdet595 = m595/L;
dVerdet595m = dm595/L;
hold off

lambda = [440, 580, 595];
verdet = [verdet440, verdet580, verdet595];

figure(4)
plot(lambda, verdet)