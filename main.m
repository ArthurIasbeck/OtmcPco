init; %#ok<*NUSED>

global N dt A B n m x0 xObj uMin uMax stepCost finalCost

addpath('src');

userInput;

% Discretização do modelo =================================================
n = size(At,1);
m = size(Bt,2);
Ct = eye(n);
Dt = zeros(n,m);
modelSsC = ss(At, Bt, Ct, Dt);
modelSsD = c2d(modelSsC,dt);
A = modelSsD.A;
B = modelSsD.B;

% Palpite inicial para os controles =======================================
u0 = u0Amp*rand(m,N-1);

% Variáveis auxiliares ====================================================
% N = N + 1;
J = @fObj;
c = @const;

% Escolha do método e solução do PCO ======================================
options = optimoptions(@fmincon,'Algorithm','sqp');
tic;
[U, Jbest, ~, output] = fmincon(J,u0,[],[],[],[],[],[],c,options);
totalTime = toc;

% Determinação de x* ======================================================
[~, X] = fObj(U);
xFinal = X(:,end);

% Apresentação dos resultados =============================================
tU = (0:N-2)*dt;
tX = (0:N-1)*dt;
if ~exist('lgdXPos','var')
    lgdXPos = 1;
end
if ~exist('lgdUPos','var')
    lgdUPos = 1;
end
if ~exist('xNames','var')
    xNames = {};
end
if ~exist('uName','var')
    uName = {};
end

% Plot dos controles ======================================================
figure; plotI(tU,U,'.-'); 
xlimI(tU);
ylimI(U);
xlabelI('$t$ ($s$)');
ylabelI('$u$');
lgd = {''};
for i = 1:m
    lgd(i) = {['$u_', num2str(i),'$']};
end
if isempty(uName)
    legendI(lgd,lgdUPos);
else
    legendI(uName, lgdUPos);
end
cropPlotI;
axisCommaI;
printI('u');

% Plot dos estados ========================================================
figure; plotI(tX,X,'.-');
xlimI(tX);
ylimI(X);
xlabelI('$t$ ($s$)');
ylabelI('$x$');
lgd = {''};
for i = 1:n
    lgd(i) = {['$x_', num2str(i),'$']};
end
if isempty(xNames)
    legendI(lgd, lgdXPos);
else
    legendI(xNames, lgdXPos);
end
cropPlotI;
axisCommaI;
printI('x');

% Salvando dados para execução da simulação ===============================
phi = X(3,:);
X = X(1,:);

save src/simData phi X
%%
clc;
fprintf('J* = %f\n', Jbest);
fprintf('x(tf) = [ ');
for i = 1:n
    fprintf('%f ', xFinal(i));
end
fprintf(']\n');
fprintf('n_aval = %d\n', output.funcCount);
fprintf('const = %f\n', output.constrviolation);
fprintf('t = %f\n', totalTime);