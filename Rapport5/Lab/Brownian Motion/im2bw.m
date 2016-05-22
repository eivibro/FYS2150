function S = im2bw(Ig,level)
S = Ig;
S(Ig > level) = 1;
S(Ig <= level) = 0;
end