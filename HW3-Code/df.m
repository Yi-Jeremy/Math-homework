function y = df( x, index)
if(index == 1)
    y = [ 12 -2*x(2) -4;
        2*x(1) 10 -1;
        0 3*x(2)^2 10 ] ;
else
    y = [3 sin(x(2)*x(3))*x(3) sin(x(2)*x(3))*x(2); 
    2*x(1) 2*81*(x(2)+0.1) cos(x(3)); 
    -x(2) -x(1) 20] ;
end