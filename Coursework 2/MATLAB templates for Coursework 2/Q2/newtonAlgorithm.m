function [ x,f,iter ] = newtonAlgorithm( systemFunction, x0, tol, ...
                                         makeJacobian, linearSolve, maxIts )

% Basic Newton algorithm for systems of nonlinear equations
%  function [ x,f ] = newtonAlgorithm( systemFunction, x0, tol, ...
%                                      makeJacobian, linearSolve )
% Input: systemFunction - nonlinear function name
%        x0 - initial state
%        tol - convergence tolerance
%        makeJacobian - function to construct Jacobian matrix
%        linearSolve - function to solve a linear system
%        maxIts - maximum Newton iterations
% Output: x - final point
%         f - final function value
%         iter - Newton iterations required

fprintf(' iteration |f|\n')

n = length(x0);     % number of equations

x = x0;             % initial point
f = feval( systemFunction, x );  % initial function values

iter=0;

fprintf(' %d %18.12f\n',iter,norm(f) )
normFprev = norm(f);

while( norm(f)>tol && iter<maxIts )                    % test for convergence

  iter = iter + 1;
 
  J = feval( makeJacobian, n, x, f, systemFunction );  % build Jacobian
  
  % Eisenstat-Walker rule
  nu = 0.1 * norm(f)^2 / normFprev^2;
 
  delta = feval( linearSolve, J, -f, norm(f), nu );                 % solve linear system
  
  normFprev = norm(f);
  x = x + delta;                                       % update x
  f = feval( systemFunction, x );                      % new function values
  
  %[ x,f,normf ] = lineSearch( systemFunction, x, norm(f), delta );
  
  % Print the iteration number and function norm.
  fprintf(' %d %18.12f\n',iter,norm(f) )
  

end

if( iter < maxIts )
  fprintf(' SUCCESS: Converged\n');
else
  fprintf(' WARNING: Not converged\n');
end

end

