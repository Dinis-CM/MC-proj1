function x_n = halley(i_s, r, v_i, v_t, x_0, N, e)

f = @(x) i_s * (exp(x / v_t) - 1) - (v_i - x) / r;
df = @(x) i_s/v_t * exp(x / v_t) + 1/r;
d2f = @(x) i_s/(v_t^2) * exp(x / v_t);
L_f = @(x) f(x) * d2f(x) / (2 * df(x)^2);
g = @(x) x - (1/(1-L_f(x))) * (f(x)/df(x));

x_n(1) = x_0;

for i=1:N
    x_n(i+1) = g(x_n(i));
    if abs(x_n(i+1) - x_n(i)) < e
        break;
    end
end
 