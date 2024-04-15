function [x, f] = gradientDescentL(fnon, x0, tol, maxIt, beta, k, G)
    % Gradient descent method with line-search for optimization
    %  function [x, f] = gradientDescentL(fnon, x0, tol, maxIt, beta, k, G)
    % Input: fnon - function handle for objective function
    %        x0 - initial guess (column vector)
    %        tol - convergence tolerance
    %        maxIt - maximum number of iterations
    %        beta, k, G - additional parameters for the objective function
    % Output: x - final solution
    %         f - final function value

    fprintf(' it     |f(x)|\n')

    x = x0;             % initial point
    f = feval(fnon, x, beta, k, G);  % initial function value
    normf = norm(f);
    it = 0;
    fprintf(' %d %12.6f\n', it, normf);

    while (normf > tol) && (it < maxIt)
        % Compute the gradient numerically
        g = numerical_gradient(fnon, x, beta, k, G);

        % Line search along the gradient direction
        [x, f, normf] = lineSearch(fnon, x, normf, -g, beta, k, G);

        it = it + 1;
        % Print the new estimate and function value
        fprintf(' %d %12.6f\n', it, normf)
    end

    if (it == maxIt)
        fprintf(' WARNING: Not converged\n')
    else
        fprintf(' SUCCESS: Converged\n')
    end
end
