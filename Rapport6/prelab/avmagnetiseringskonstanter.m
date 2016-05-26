function [Dp, Dv] = avmagnetiseringskonstanter(f)
eps = sqrt(1-1./f.^2);
Dp = (1-1./(eps.^2)).*(1-1./(2*eps).*log((1+eps)./(1-eps)));
Dv = (1-Dp)./2;