%% Método de Halley 
% Função aplicadora do método iterativo de Halley para uma dada função f (oriunda da equação de Schockley). 
% Aproxima a raiz z da equação (ou seja, z tal que f(z)=0).
% Para quando atingir a iteração N, ou até o valor absoluto da diferença entre duas iterações consecutivas ser menor do que e.
% Input: 
%   i_s - Corrente de saturação
%   r - Resistência
%   v_i - Tensão inicial 
%   v_t - Tensão térmica
%   x_0 - Iterada inicial
%   N - Número máximo de iterações
%   e -  Critério de paragem
% Output:
%   x_n - Vetor das iteradas [x_0,x_1,...x_N], sendo x_N a melhor aproximação de z
% Utilização:
%   >> x_n = halley(10^-14,1000,2,0.026,0.7,100,10^-5);

function x_n = halley(i_s, r, v_i, v_t, x_0, N, e)

% Definição da função f e da suas duas primeiras derivadas
f = @(x) i_s * (exp(x / v_t) - 1) - (v_i - x) / r;
df = @(x) i_s/v_t * exp(x / v_t) + 1/r;
d2f = @(x) i_s/(v_t^2) * exp(x / v_t);

% Definição das funções associadas ao método de Halley
L_f = @(x) f(x) * d2f(x) / (2 * df(x)^2);
g = @(x) x - (1/(1-L_f(x))) * (f(x)/df(x));

% Inicialização do vetor das iteradas
x_n=[x_0, zeros(1,N-1)];

% Iterar até atingir o número máximo de iterações, 
% ou até o valor absoluto da diferença entre duas iterações consecutiva ser menor do que e
for i=1:N
    x_n(i+1) = g(x_n(i));    

    if abs(x_n(i+1) - x_n(i)) < e
        break;
    end
end
 
% Remoção de espaços relativos a iteradas não calculadas
x_n = x_n(1:i+1);

end