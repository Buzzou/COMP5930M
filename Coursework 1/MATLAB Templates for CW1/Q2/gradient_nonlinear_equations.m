function g = gradient_nonlinear_equations(x, beta, k, G)
    n = length(x);
    g = zeros(n, 1);
    for i = 2:n
        g(i) = 2 * beta * x(i) + 1;
    end
    g(1) = -1;
end

