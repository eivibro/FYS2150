clear
close all


A240 = imread('MTF_20X_240LP.jpg');
[Imax240,Imin240] = getI(A240);

A360 = imread('MTF_20X_360LP.jpg');
[Imax360,Imin360] = getI(A360);

A480 = imread('MTF_20X_480LP.jpg');
[Imax480,Imin480] = getI(A480);

A600 = imread('MTF_20X_600LP.jpg');
[Imax600,Imin600] = getI(A600);


MTF240_20 = (Imax240-Imin240)/(Imax240+Imin240);
MTF360_20 = (Imax360-Imin360)/(Imax240+Imin240);
MTF480_20 = (Imax480-Imin480)/(Imax240+Imin240);
MTF600_20 = (Imax600-Imin600)/(Imax240+Imin240);

MTF20 = [MTF240_20, MTF360_20, MTF480_20, MTF600_20];
linespacing = [240, 360, 480, 600];

A240 = imread('MTF_40X_240LP.jpg');
[Imax240,Imin240] = getI(A240);

A360 = imread('MTF_40X_360LP.jpg');
[Imax360,Imin360] = getI(A360);

A480 = imread('MTF_40X_480LP.jpg');
[Imax480,Imin480] = getI(A480);

A600 = imread('MTF_40X_600LP.jpg');
[Imax600,Imin600] = getI(A600);

MTF240 = (Imax240-Imin240)/(Imax240+Imin240);
MTF360 = (Imax360-Imin360)/(Imax240+Imin240);
MTF480 = (Imax480-Imin480)/(Imax240+Imin240);
MTF600 = (Imax600-Imin600)/(Imax240+Imin240);

MTF40 = [MTF240, MTF360, MTF480, MTF600];
plot(linespacing, MTF20, '-x', 'MarkerSize', 10)
hold on
plot(linespacing, MTF40, '-x', 'MarkerSize', 10)
hold off 
set(gca, 'FontSize', 16)
xlabel('Linjepar per mm')
ylabel('MTF')
legend('20X objektiv', '40X objektiv')
saveas(gcf, 'MTF', 'epsc')