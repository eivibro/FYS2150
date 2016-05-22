clear

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

MTF = [MTF240, MTF360, MTF480, MTF600];
linespacing = [240 360, 480, 600];
figure(2)
plot(linespacing, MTF, '-x', 'MarkerSize', 10)
set(gca, 'FontSize', 16)
xlabel('Linjepar per mm')
ylabel('MTF')

saveas(gcf, 'MTF40X', 'epsc')