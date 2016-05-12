function [Imax,Imin] = MTF(A);

x = mean(A,1);
Imin = min(x);
Imax = max(x);

end