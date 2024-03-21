%--------------------------------------------------------------------%
%-------------------- Transformação De Joukowski --------------------%
%--------------------------- Theo Palermo ---------------------------%
%--------------------------------------------------------------------%

clear all;
clc;

%-------------------- Origem do Círculo --------------------%

xOrigem = 0.1;  % Coordenada x da Origem
yOrigem = 0.15; % Coordenada y da Origem
rCirculo = 2;   % Raio do Círculo
Z = xOrigem + i*yOrigem;

%--------------------------------------------------------------------%
%-------------------- Transformação de Joukowski --------------------%
%--------------------------------------------------------------------%

lambda = rCirculo - Z;
J = Z+lambda^2/Z;

%-----------------------------------------------------------------------%
% Da Definição da Equação de Euler: z = r*e^(iθ) = r*(cos(θ) + i sin(θ) %
%-----------------------------------------------------------------------%

angulo = linspace(0, 2*pi, 100);
z_Circulo = rCirculo*(cos(angulo)+i*sin(angulo)) + Z;
z_Aerofolio = z_Circulo+lambda^2./z_Circulo;

%--------------------------------------------------%
%-------------------- Gráficos --------------------%
%--------------------------------------------------%

%--------------- Plotando o Círculo ---------------%

figure(1);
plot(real(z_Circulo), imag(z_Circulo), 'b');
hold on;

%--------------- Plotando o Círculo Centrado na Origem ---------------%

z_Circulo_Origem = rCirculo*(cos(angulo)+i*sin(angulo)); % Círculo Centrado na Origem
plot(real(z_Circulo_Origem), imag(z_Circulo_Origem), 'r');

%--------------- Marcando a Origem de Cada Círculo ---------------%

plot(xOrigem, yOrigem, 'bo'); % Origem do círculo azul
plot(0, 0, 'ro'); % Origem do Círculo Vermelho

%--------------- Traçando os Eixos X e Y ---------------%

line([-5, 5], [0, 0], 'Color', 'k'); % Eixo X
line([0, 0], [-5, 5], 'Color', 'k'); % Eixo Y

axis equal;
grid on;
title('Círculos', 'fontsize', 15);

%--------------- Plotando o Aerofólio ---------------%

figure(2);
plot(real(z_Aerofolio), imag(z_Aerofolio), 'r');
axis equal;
grid on;
title('Aerofólio', 'fontsize', 15);

