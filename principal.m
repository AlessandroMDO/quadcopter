% Grupo Quad Catupiry
% SAA0168 - 2020

%% SCRIPT PRINCIPAL

clc
clear all
close all

%% QUAD SETTINGS

quad.g=9.81; %gravidade [kg.s^-2]
quad.m=0.450; %massa [kg]
quad.l=0.175; %comprimento do core aos motores [m]

quad.ct = 8.048e-6; % thurst coefficient
quad.cq = 2.243e-6; % drag coefficient

%matriz de conversão entre torques e velocidades ângulares
quad.r = [quad.ct quad.ct quad.ct quad.ct; -quad.ct*quad.l 0 quad.ct*quad.l 0;
    0 -quad.ct*quad.l 0 quad.ct*quad.l; -quad.cq quad.cq -quad.cq quad.cq]

quad.Ixx=2.237e-3; %momento de inercia Ixx [kg.m^2]
quad.Iyy=2.985e-3; %momento de inercia Iyy [kg.m^2]
quad.Izz =4.803e-3;%momento de inercia Izz [kg.m^2]

%% CONTROLADOR
run controlador.m

%% TRAJETÓRIA
run trajeto.m

%% SIMULAÇÃO
sim('quad2LQR.slx')