function y = Lagrange ( x0, y0 , x)
%拉格朗日插值函数@
    n = length(x0); 
    m = length( x ) ;
    for i = 1: m
        z = x(i) ;
        s = 0;
        for k = 1: n
            p = 1;
            for j = 1: n
                if(j ~= k)
                    p = p * (z - x0 (j))/ ( x0( k) - x0 (j)) ;
                end
            end
            s = s + p * y0( k ) ;
        end
        y(i) = s;
    end