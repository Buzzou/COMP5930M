function [ t,x ] = feuler( n,dt )

% Forward Euler approximation to undamped pendulum model
%  function [ t,x ] = feuler( n,dt )
% Input: n - number of time steps
%        dt - timestep size
% Output: t - vector of discrete solution times
%         x - numerical solution at each time

% initial conditions (t,x)=(-pi/4,0); 
t=zeros(n+1,1);
x=[ [-pi/4 0]; zeros(n,2) ];  

% time stepping

for i=1:n
   
    t(i+1) = t(i) + dt;
    x(i+1,:) = x(i,:) + dt*pendulum(t,x(i,:));
    
end

figure(1)
subplot(2,1,1)
plot(t,x(:,1),'-*k');
xlabel('Time');
ylabel('theta');
subplot(2,1,2)
plot(t,x(:,2),'-*k');
xlabel('Time');
ylabel('phi');
end
