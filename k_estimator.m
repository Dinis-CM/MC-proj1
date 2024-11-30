clear all

x_n = halley(10^-14,1000,2,0.026,0.7,100,10^-5);

f = @(x) 10^-14 * (exp(x / 0.026) - 1) - (2 - x) / 1000;

z = fzero(f,0.7);

p = 2.9:0.1:4.1;

for i = 1:length(p)
    for j = 1:length(x_n)-1
       K(j,i) = abs(z-x_n(j+1)) / abs(z-x_n(j))^p(i);
    end
end


