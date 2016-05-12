clear

A240 = imread('MTF_20x_240LP.jpg');
[Imax240,Imin240] = getI(A240);

A360 = imread('MTF_20x_360LP.jpg');
[Imax360,Imin360] = getI(A360);

A480 = imread('MTF_20x_480LP.jpg');
[Imax480,Imin480] = getI(A480);

A600 = imread('MTF_20x_600LP.jpg');
[Imax600,Imin600] = getI(A600);


MTF360 = (Imax360-Imin360)/(Imax240-Imin240);
MTF480 = (Imax480-Imin480)/(Imax240-Imin240);
MTF600 = (Imax600-Imin600)/(Imax240-Imin240);