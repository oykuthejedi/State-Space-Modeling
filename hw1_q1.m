% Parameter Values
M1 = 5;
M2 = 20;
k1 = 150;
k2 = 700;
b1 = 15;
b2 = 30;

% State Space Matrices

A = [0 1 0 0;
    -k1/M1 -b1/M1 k1/M1 b1/M1;
    0 0 0 1;
    k1/M2 b1/M2 -(k1+k2)/M2 -(b1+b2)/M2];
B = [0;1/M1;0;0];
C = [1 0 0 0; 0 0 1 0];
D = [0;0];

% Initial Conditions [p(0),q(0),p'(0),q'(0)]
x0 = [0.1; 0; 0; 0];

% Time span
t = 0:0.01:10; % Time vector from 0 to 10 seconds

% u(t) = 0
u = zeros(size(t));

% Solving of the system
sys = ss(A,B,C,D);
[y,t,x] = lsim(sys,u,t,x0);

% Combined Plot for Cart Displacements
figure;
plot(t, y);
title('Combined Displacement of Carts');
xlabel('Time (s)');
ylabel('Displacement (m)');
legend('Cart 1', 'Cart 2');

% Detailed Subplots for Individual Cart Displacements
figure;
subplot(2,1,1);
plot(t, x(:,4), 'b', 'LineWidth', 1);
title('Displacement of Cart 2');
xlabel('Time (s)');
ylabel('Displacement (m)');
subplot('Position', [0.13, 0.1, 0.775, 0.3]); 
plot(t, x(:,3), 'r', 'LineWidth', 1);
title('Displacement of Cart 1');
xlabel('Time (s)');
ylabel('Displacement (m)');

sgtitle('System Response');