%#ok<*AGROW>
function [c, ceq] = const(U)

global xf n m N xObj uMin uMax

if length(uMin) ~= m || length(uMax) ~= m
    error('Verifique as dimensões de uMin e uMax!');
end

xtf = xf;
for i = 1:length(xObj)
    if ~isinf(xObj(i))
        xtf(i) = xObj(i);
    end
end

c = [];
k = 1;
for i = 1:N-1
    for j = 1:m
        if ~isinf(uMin)
            c(k) = - U(j,i) + uMin(m); 
        end
        if ~isinf(uMax)
            c(k+1) = U(j,i) - uMax(m);
        end
        k = k + 2;
    end
end

ceq = [];
for i = 1:n
    ceq(i) = xtf(i) - xf(i);
end

