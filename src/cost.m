function J = cost(X,U)

global N stepCost finalCost

J = 0;
for i = 1:N
    if i ~= N
        x = X(:,i);
        u = U(:,i);
        J = J + stepCost(x,u);
    else
        x = X(:,i);
        J = J + finalCost(x);
    end
end