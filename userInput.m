x0 = [0 0 0 0]'; % Estados iniciais
xObj = [0.5 0 0 0]; % Estados finais
u0Amp = 0; % Amplitude dos controles iniciais
uMin = -Inf; % Limites inferiores para os controles
uMax = Inf; % Limites superiores para os controles

% Função objetivo =========================================================
stepCost = @(x,u) (u'*u)*dt;
finalCost = @(x) 0;

% Discretização do domínio ================================================
tf = 2;
N = 40;
dt = tf/N;

% Determinação do modelo ==================================================
M1 = 0.5;
M2 = 0.2;
b = 0.1;
I = 0.006;
g = 9.8;
l = 0.3;

p = I*(M1+M2)+M1*M2*l^2;

At = [0 1 0 0
     0 -(I+M2*l^2)*b/p (M2^2*g*l^2)/p 0
     0 0 0 1
     0 -(M2*l*b)/p M2*g*l*(M1+M2)/p 0];
Bt = [0
     (I+M2*l^2)/p
     0
     M2*l/p];

% Opções para apresentação dos resultados =================================
xNames = {'$x$', '$\dot{x}$', '$\phi$', '$\dot{\phi}$'};
uName = {'$F$'};
lgdXPos = 2;
lgdUPos = 1;
