function x = iterativeLinearSolve( A, b, nonLinearRes, nu, M )

% function x = linearSolve( A, b )
%  Linear solution algorithm for the
%  system Ax=b
% Input: nxn matrix A
%        n-dim column vector b
% Output: n-dim column vector x

% Inexact Newton-Krylov method
linTol = 1e-7;
 
M=[];

if (isempty(M))
    x = gmres(A,b,[],linTol,100);
else
    x = gmres(A,b,[],linTol,100,M);
end

end
