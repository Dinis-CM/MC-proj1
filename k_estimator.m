clear all

x_n = halley(10^-14,1000,2,0.026,0.7,100,10^-5);

f = @(x) 10^-14 * (exp(x / 0.026) - 1) - (2 - x) / 1000;

z = fzero(f,0.7);

p = 2.5:0.1:4.5;

for i = 1:length(p)
    for j = 1:length(x_n)-1
       K(i,j) = abs(z-x_n(j+1)) / abs(z-x_n(j))^p(i);
    end
end

rowNames = cell(1,length(p));
for i = 1:length(p)
    rowNames{i} = sprintf('p = %.1f', p(i));
end

varNames = cell(1, length(x_n)-1);
for i = 1:length(x_n)-1
    varNames{i} = sprintf('|e_%.0f|/|e_%.0f|^p', i, i-1);
end

table = array2table(K, 'VariableNames', varNames, 'RowNames', rowNames);

disp(table);