function [J, X] = fObj(U)

global xf N A B n x0

% Obtenção dos estados
X = zeros(n,N);
X(:,1) = x0;
for k = 1:N-1
    X(:,k+1) = A*X(:,k) + B*U(:,k);
end
xf = X(:,end);

J = cost(X,U);