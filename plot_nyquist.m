%% Nyquist plot

clear, clc

gamma = 1;
rho = 0.1;

A = [0 1 0; 0 -0.875 -20; 0 0 -50];
B = [0; 0; 50];
G = [1 0 0; 0 gamma 0];
H = [0; 0];

Q = eye(2);
R = 1;

QQ = G' * Q * G;
RR = H' * Q * H + rho * R;
NN = G' * Q * H;

K = lqr(A, B, QQ, RR, NN);

sys = ss(A, B, K, 0);

% [num,den] = ss2tf(A, B, K, 0);

figure(1)
nyquist(sys)
hold on

t=0:pi/10:2*pi;
x=cos(t)-1;
y=sin(t);
plot(x,y,'r')

title('\gamma=1, \rho=0.1')


%% introduce state feedback

clear, clc

A = [0 1 0; 0 -0.875 -20; 0 0 -50];
B = [0; 0; 50];
% p = -1, -2, -3

K = place(A, B, [-1, -2, -3]);

sys = ss(A, B, K, 0);

figure(1)
nyquist(sys)
hold on

t=0:pi/10:2*pi;
x=cos(t)-1;
y=sin(t);
plot(x,y,'r')

title('poles placing p=-1, -2, -3')
