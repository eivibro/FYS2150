clear
close all

load('Faraday.mat')
[m c, dm, dc] = uncertaintyLinearFitting(B, theta);

L = 30e-3;
dL = 1e-3;

plot(B, theta)
hold on
plot(B, c + m*B)

V = m/L;
dV = V*sqrt((dm/m)^2+(dL/L)^2);

