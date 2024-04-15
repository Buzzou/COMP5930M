function [ t, x ] = midpoint(n, dt)
% Midpoint Method for undamped pendulum model
%   function [ t, x ] = midpoint(n, dt)
% Input: 
%   n - number of time steps
%   dt - timestep size
% Output: 
%   t - vector of discrete solution times
%   x - numerical solution at each time

% Initialize time vector and solution vector
t = zeros(n+1, 1);
x = zeros(n+1, 2);  % Initial state [theta, phi]

% Initial conditions
t(1) = 0;
x(1,:) = [-pi/4, 0];  % Initial state [theta, phi]

% Time stepping
for i = 1:n
    t(i+1) = t(i) + dt;
    
    % Backward Euler half-step
    x_half = x(i,:) + 0.5 * dt * pendulum(t(i), x(i,:));
    
    % Update using midpoint method
    x(i+1,:) = x(i,:) + dt * pendulum(t(i) + 0.5 * dt, x_half);
end

% Plot
figure;
subplot(2,1,1);
plot(t, x(:,1), '-*k');
xlabel('Time');
ylabel('theta');
title('Midpoint Method: theta vs Time');

subplot(2,1,2);
plot(t, x(:,2), '-*k');
xlabel('Time');
ylabel('phi');
title('Midpoint Method: phi vs Time');
end
