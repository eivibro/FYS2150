clear
close all

f = linspace(0.01, 6, 1e4);
[Dp, Dv] = avmagnetiseringskonstanter(f);

plot(f, abs(Dp), 'r')
hold on
plot(f, abs(Dv), 'b')
hold off