%% Script para geração da trajetória

trajeto_arena = readtable("trajeto.xlsx"); %%lê a planilha com a trajetória

t_ref=trajeto_arena.t;

x_ref=trajeto_arena.xt;
y_ref=trajeto_arena.yt;
z_ref=trajeto_arena.zt;

%% Gera trajetória suavizada
t_spline=0:0.001:trajeto_arena.t(end);
x_spline=pchip(t_ref,x_ref,t_spline); % 
z_spline=pchip(t_ref,z_ref,t_spline); % splines são geradas
y_spline=pchip(t_ref,y_ref,t_spline); % 


%o ângulo de guinada psi foi obtido como a derivada dy/dx
tan = atan(gradient(y_spline)./gradient(x_spline)); 
psi_spline = (pi - tan);

%% Cria uma estrutura, que depois é enviada para o Simulink
referencia.time=t_spline';
referencia.signals.values=[psi_spline' x_spline' y_spline' z_spline'];
