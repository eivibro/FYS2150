function [m, c, delta_m, delta_c] = uncertaintyLinearFitting(x_data, y_data)
n = length(x_data);
D = sum(x_data.^2)-1/n*(sum(x_data))^2;
E = sum(x_data.*y_data)-1/n*sum(x_data)*sum(y_data);
F = sum(y_data.^2)-1/n*(sum(y_data))^2;
x_mean = mean(x_data);
y_mean = mean(y_data);
m = E/D;
c = y_mean-m*x_mean;
d = y_data - m*x_data - c;
delta_m = sqrt(1/(n-2)*(D*F-E^2)/D^2);
delta_c = sqrt(1/(n-2)*(D/n+x_mean^2)*(D*F-E^2)/D^2);
end

