clear all

v_i = linspace(0, 15, 30);

for i = 1:length(v_i)
    aux = halley(10^-14,1000,v_i(i),0.026,0.7,100,10^-5);
    x_n(i) = aux(end);
end

plot(v_i,x_n, 'o');