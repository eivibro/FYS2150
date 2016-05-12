clear

A = imread('bilde1_gitter_20x.jpg');
B = A;%mean(A,3);

x = mean(B,1);
y = mean(B,2);

thx = find(x<160);
dthx = diff(thx);
xinds = find(dthx>1)+1;
xdkant = diff(thx([1 xinds]));

thy = find(y'<160);
dthy = diff(thy);
yinds = find(dthy>1)+1;
ydkant = diff(thy([1 yinds]));

d = 0.1; % mm
sx = d/mean(xdkant);
sy = d/mean(ydkant);

figure
subplot(2,1,1)
plot(x)
subplot(2,1,2)
plot(y)