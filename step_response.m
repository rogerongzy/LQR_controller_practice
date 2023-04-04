%% step response for mutable rho

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

C = [1 0 0];
D = 0;
sys_1 = ss(A - B * K1, B, C, D);
sys_2 = ss(A - B * K2, B, C, D);
sys_3 = ss(A - B * K3, B, C, D);

[y_1, t_1] = step(sys_1, 8);
[y_2, t_2] = step(sys_2, 8);
[y_3, t_3] = step(sys_3, 8);
y_1 = abs(y_1);
y_2 = abs(y_2);
y_3 = abs(y_3);

% overshoot
sigma_1 = (max(y_1) - y_1(length(y_1)))/y_1(length(y_1));
sigma_2 = (max(y_2) - y_2(length(y_2)))/y_2(length(y_2));
sigma_3 = (max(y_3) - y_3(length(y_3)))/y_3(length(y_3));

% settle time
for i=length(y_1):-1:1
    if abs(y_1(i) - y_1(length(y_1)))/y_1(length(y_1)) >= 0.02
        ts_1 = t_1(i);
        break
    end
end

for i=length(y_2):-1:1
    if abs(y_2(i) - y_2(length(y_2)))/y_2(length(y_2)) >= 0.02
        ts_2 = t_2(i);
        break
    end
end

for i=length(y_3):-1:1
    if abs(y_3(i) - y_3(length(y_3)))/y_3(length(y_3)) >= 0.02
        ts_3 = t_3(i);
        break
    end
end

figure(1)
% step(sys_1, sys_2, sys_3, 8);
plot(t_1, y_1)
hold on
plot(t_2, y_2)
hold on
plot(t_3, y_3)

axis([0, 8, 0, 13])
title('Step Response of \rho=0.1,10,100')
legend('\rho=0.1','\rho=10','\rho=100')


%% step response for mutable gamma

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

C = [1 0 0];
D = 0;
sys_1 = ss(A - B * K1, B, C, D);
sys_2 = ss(A - B * K2, B, C, D);
sys_3 = ss(A - B * K3, B, C, D);

[y_1, t_1] = step(sys_1, 8);
[y_2, t_2] = step(sys_2, 8);
[y_3, t_3] = step(sys_3, 8);
y_1 = abs(y_1);
y_2 = abs(y_2);
y_3 = abs(y_3);

% overshoot
sigma_1 = (max(y_1) - y_1(length(y_1)))/y_1(length(y_1));
sigma_2 = (max(y_2) - y_2(length(y_2)))/y_2(length(y_2));
sigma_3 = (max(y_3) - y_3(length(y_3)))/y_3(length(y_3));

% settle time
for i=length(y_1):-1:1
    if abs(y_1(i) - y_1(length(y_1)))/y_1(length(y_1)) >= 0.02
        ts_1 = t_1(i);
        break
    end
end

for i=length(y_2):-1:1
    if abs(y_2(i) - y_2(length(y_2)))/y_2(length(y_2)) >= 0.02
        ts_2 = t_2(i);
        break
    end
end

for i=length(y_3):-1:1
    if abs(y_3(i) - y_3(length(y_3)))/y_3(length(y_3)) >= 0.02
        ts_3 = t_3(i);
        break
    end
end

figure(1)
% step(sys_1, sys_2, sys_3, 8);
plot(t_1, y_1)
hold on
plot(t_2, y_2)
hold on
plot(t_3, y_3)

axis([0, 8, 0, 0.13])
title('Step Response of \gamma=0.01,0.1,1')
legend('\gamma=0.01','\gamma=0.1','\gamma=1')