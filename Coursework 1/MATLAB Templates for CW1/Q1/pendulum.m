function [ f ] = pendulum( t,x )

% ODE system right-hand-side for model of undamped pendulum
% System represented as dx/dt = f(t,x)
%  function [ f ] = pendulum( t,x )
% Input: t - current time
%        x - vector of current solution values
% Output: f - right-hand-side of the ODE system evaluated at (t,x)

f(1) = x(2);
f(2) = -sin(x(1));

end

