%% K_estimator
% Estima o valor do coeficiente assintótico de convergência do método de
% Halley (K), no caso x_n apresentado, para diversos valores de ordem 
% de convergência (p).
% No caso de uma estimação correta de p, o valor de K deve manter-se
% aproximadamente constante entre iteradas, tendo  o valor limite de 
% K = |e_(N)|/|e_(N-1)|^p, sendo N a maior iterada calculada.

% Aproximações x_n da raiz z a serem analisadas
x_n = halley(10^-14,1000,2,0.026,0.7,100,10^-5);

% Determinação do valor "real" da raiz x
f = @(x) 10^-14 * (exp(x / 0.026) - 1) - (2 - x) / 1000;
z = fzero(f,0.7);

% Vetor de valores estimados para p
p = 2.8:0.05:3.3;

% Para cada p e cada iterada x_(n+1), determinar K = |e_(n+1)|/|e_n|^p
for i = 1:length(p)
    for j = 1:length(x_n)-1
       K(i,j) = abs(z-x_n(j+1)) / abs(z-x_n(j))^p(i);
    end
end

% Nome das linhas da tabela do tipo 'p = '
rowNames = cell(1,length(p));
for i = 1:length(p)
    rowNames{i} = sprintf('p = %.2f', p(i));
end

% Nome das colunas da tabela do tipo '|e_(n+1)|/|e_n|^p'
varNames = cell(1, length(x_n)-1);
for i = 1:length(x_n)-1
    varNames{i} = sprintf('|e_%.0f|/|e_%.0f|^p', i, i-1);
end

% Tabela dos valores de K calculados, em termos de p (linhas) e iteradas
% utilizadas (linhas)
table = array2table(K, 'VariableNames', varNames, 'RowNames', rowNames);
disp(table);