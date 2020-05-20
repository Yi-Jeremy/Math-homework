function [ y, n, T xo] = newtonpro( tol, Nb,x0)
% 牛顿迭代法求解方程
tic; 
if isempty(x0)
    if(Nb == 1) 
        x0 = [1 1 1];
        xo=x0;
    else
        x0 = [ 0 0 0]; 
        xo=x0;
    end
else
    xo=x0;
end
x1 = x0 - fc( x0, Nb )/ df( x0, Nb) ;
n = 1;
while ( norm( x1 - x0) >= tol) && ( n < 100000000)
    x0 = x1;
    x1 = x0 - fc( x0 , Nb)/ df( x0, Nb) ; n = n + 1;
end
y = x1;
T = toc;
