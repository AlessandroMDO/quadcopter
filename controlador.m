%% Script para geração do controlador LQR

A = zeros(12);
A(1,4) = 1; A(2,5)=1;A(3,6) = 1;
A(7,2)=-quad.g; A(8,1) = quad.g;
A(10,7) = 1; A(11,8) = 1;A(12,9) = 1;

B = zeros(12,4);
B(4,2)=1/quad.Ixx; B(5,3)=1/quad.Iyy; B(6,4)=1/quad.Izz;
B(9,1)=1/quad.m;

C = eye(12);
D = zeros(12,4);

Con=[B A*B A^2*B A^3*B A^4*B A^5*B A^6*B A^7*B A^8*B A^9*B...
    A^(10)*B A^(11)*B];
    
Obs=[C; C*A;C*A^2; C*A^3; C*A^4; C*A^5;C*A^6;C*A^7;C*A^8;
    C*A^9; C*A^(10); C*A^(11)];

%Tanto Con quanto Obs possuem rank = 12, indicando controlabilidade
%e observabilidade

Q = diag([1 1 1 .1 .1 1 .1 .1 1 1 1 .01]);
R = diag([1e-2,1e-5,1e-5,1e-2]);

K = lqr(A,B,Q,R);