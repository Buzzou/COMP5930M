% Newton's method
function [root, num_iter] = newton_method(z0, f, df, tol, max_iter)
    z = z0;
    for i = 1:max_iter
        z = z - f(z) / df(z);
        if abs(f(z)) < tol
            root = z;  % Return the root
            num_iter = i;  % Return the number of iterations
            return
        end
    end
    root = z;  % If not converged, return the last estimate
    num_iter = max_iter;
end