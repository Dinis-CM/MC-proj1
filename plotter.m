%% Plotter
% Expõe graficamente a variação da aproximação x_N (ver halley.m) com a 
% variação do input v_i.

% Definição de v_i, dado por uma partição de [0 15] com 30 pontos
v_i = linspace(0, 15, 30);

% Definição do vetor das aproximações de x_N
x_N=zeros(1, length(v_i));

% Determinação de x_N consoante o valor de v_i, sendo x_N a maior iterada
% do vetor de iteradas iter, calculadas com o método de Halley
for i = 1:length(v_i)
    iter = halley(10^-14,1000,v_i(i),0.026,0.7,100,10^-5);
    x_N(i) = iter(end);
end

% Gráfico do valor de x_N consoante v_i
plot(v_i,x_N, 'o');