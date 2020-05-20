function [ x, n, T,xo] = broyden1 ( tol, Nb ,x0)
tic;
if isempty(x0)
    if(Nb == 1) 
        x0 = [ 1 1 1]'; 
        xo=x0';
    else
        x0 = [0 0 0]'; 
        xo=x0';
    end
else
    x0=x0';
    xo=x0';
end
x = x0 ; B = inv( df( x0 , Nb)') ;
x1 = x - B * fc( x, Nb)';
s = x1 - x; n = 1;
y = fc( x1 , Nb)'- fc ( x, Nb)';
B1 = B + (s - B * y) * s'* B/(s'* B * y) ;
while norm (s) >= tol
    x = x1; B = B1;
    x1 = x - B * fc ( x, Nb)';
    B1 = B + (s - B * y ) * s'* B/ (s'* B * y ) ;
    s = x1 - x; y = fc( x1, Nb)'- fc( x, Nb)';
    n = n + 1;
end
x = x1';
T = toc;
