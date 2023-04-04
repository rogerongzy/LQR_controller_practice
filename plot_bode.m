%% fixed gamma, change rho

clear, clc

gamma = 0.01;
rho1 = 0.1;
rho2 = 10;
rho3 = 100;

A = [0 1 0; 0 -0.875 -20; 0 0 -50];
B = [0; 0; 50];
G = [1 0 0; 0 gamma 0];
H = [0; 0];

Q = eye(2);
R = 1;

QQ = G' * Q * G;
RR1 = H' * Q * H + rho1 * R;
RR2 = H' * Q * H + rho2 * R;
RR3 = H' * Q * H + rho3 * R;
NN = G' * Q * H;

K1 = lqr(A, B, QQ, RR1, NN);
K2 = lqr(A, B, QQ, RR2, NN);
K3 = lqr(A, B, QQ, RR3, NN);

sys_1 = ss(A, B, K1, 0);
sys_2 = ss(A, B, K2, 0);
sys_3 = ss(A, B, K3, 0);

% [num,den] = ss2tf(A, B, K, 0);
% [mag,phase] = bode(num,den,w)

figure(1)
% use 'bode' command including 'sigma'
% bode(sys_1)
margin(sys_1) % including Bode
[Gm1,Pm1,Wcg1,Wcp1] = margin(sys_1);
hold on
% bode(sys_2)
margin(sys_2)
[Gm2,Pm2,Wcg2,Wcp2] = margin(sys_2);
hold on
% bode(sys_3)
margin(sys_3)
[Gm3,Pm3,Wcg3,Wcp3] = margin(sys_3);


title('\gamma=0.01')
legend('\rho=0.1','\rho=10','\rho=100')


%% fixed rho, change gamma

clear, clc

rho = 0.01;
gamma1 = 0.01;
gamma2 = 0.1;
gamma3 = 1;

A = [0 1 0; 0 -0.875 -20; 0 0 -50];
B = [0; 0; 50];
G1 = [1 0 0; 0 gamma1 0];
G2 = [1 0 0; 0 gamma2 0];
G3 = [1 0 0; 0 gamma3 0];
H = [0; 0];

Q = eye(2);
R = 1;

QQ1 = G1' * Q * G1;
QQ2 = G2' * Q * G2;
QQ3 = G3' * Q * G3;
RR = H' * Q * H + rho * R;
NN1 = G1' * Q * H;
NN2 = G2' * Q * H;
NN3 = G3' * Q * H;

K1 = lqr(A, B, QQ1, RR, NN1);
K2 = lqr(A, B, QQ2, RR, NN2);
K3 = lqr(A, B, QQ3, RR, NN3);

sys_1 = ss(A, B, K1, 0);
sys_2 = ss(A, B, K2, 0);
sys_3 = ss(A, B, K3, 0);

% [num,den] = ss2tf(A, B, K, 0);
% [mag,phase] = bode(num,den,w)

figure(1)
% use 'bode' command including 'sigma'
% bode(sys_1)
margin(sys_1) % including Bode
[Gm1,Pm1,Wcg1,Wcp1] = margin(sys_1);
hold on
% bode(sys_2)
margin(sys_2) % including Bode
[Gm2,Pm2,Wcg2,Wcp2] = margin(sys_2);
hold on
% bode(sys_3)
margin(sys_3) % including Bode
[Gm3,Pm3,Wcg3,Wcp3] = margin(sys_3);

title('\rho=0.01')
legend('\gamma=0.01','\gamma=0.1','\gamma=1')