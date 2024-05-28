% State space matrices
A = [0 1 0; 0 0 1; -16 -31 -10];
B = [0; 0; 1];
C = [56 14 0];
D = [0];

% State space object
sys = ss(A, B, C, D);

% Poles and zeros
poles = pole(sys);
zeros = tzero(sys);

% Step Response
figure;
step(sys);
title('Step Response');

% Pole-Zero Map
plot(real(poles), imag(poles), 'rx');
hold on;
plot(real(zeros), imag(zeros), 'bo');
xlabel('Real Axis');
ylabel('Imaginary Axis');
title('Pole-Zero Map');
axis equal;
grid on;
xlim([-5 0]); 
ylim([-2 2]);