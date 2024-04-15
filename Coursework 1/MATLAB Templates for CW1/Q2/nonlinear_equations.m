function F = nonlinear_equations(U, beta, k, G)
    % Extracting values from U
    a = U(2:end); % Concentrations in reactors 1 to n
    a_0 = U(1); % Inlet concentration

    % Number of reactors
    n = length(a);

    % Preallocate F
    F = zeros(n, 1);

    % Nonlinear equations
    for i = 1:n
        if i == 1
            F(i) = beta * a(i)^2 + a(i) - a_0;
        else
            F(i) = beta * a(i)^2 + a(i) - a(i-1);
        end
    end
end
