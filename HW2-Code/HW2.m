%数值积分计算机求解
clc,clear
close all
strf={'- 2./(x.^2-1)','4./(1+x.^2)','3.^x','x.*exp(x)'};
funs={inline(strf{1}); inline(strf{2}) ;inline(strf{3}) ;inline(strf{4})};
result=[log(2)-log(3),pi,2/log(3),exp(2)];
lb_ub=[2,0,0,1;3,1,1,2]; %第一行下界，第二行上界
tol=0.5*1e-7;
h=0.01;
for i=1:4
    funIndex=i; %选择第一个函数
    fun=funs{funIndex};
    %%%复化梯形公式求解
    b=lb_ub(2,funIndex);
    a=lb_ub(1,funIndex);
    t = ( fun(a) + fun (b)) * (b-a)/ 2;
    k = 1; 
    t0 = 0;
    while ( abs( t - t0) >= tol * 3)
        t0 = t; h = ( b - a)/ 2^k;
        t = t0/ 2 + h * sum( fun( a + h :2 * h: b - h ) ) ;
        k = k + 1;
    end
    fprintf('对定积分 %s 在区间[%d , %d]上使用',strf{funIndex},a,b)
    fprintf('使用复化梯形公式求解 精确值为:%.7f 定积分值为:%.7f \n',[t,result(funIndex)])

    %用复化 Simpson 公式
    t = quad(fun, a , b, tol) ;
    fprintf('对定积分 %s 在区间[%d , %d]上使用',strf{funIndex},a,b)
    fprintf('使用复化 Simpson 公式求解 精确值为:%.7f 定积分值为:%.7f \n',[t,result(funIndex)])

    % 用复化 Gauss - Legendre I公式求解
    N = floor((b- a)/ h); 
    t = 0; 
    xk = 0;
    for k = 0: N
        xk = a + k * h + h/ 2;
        t = t + fun ( xk - h/ ( 2 * sqrt(3 ) ) ) + fun( xk + h/ (2 * sqrt( 3) ) ) ;
    end
    t = t * h/ 2;
    fprintf('对定积分 %s 在区间[%d , %d]上使用',strf{funIndex},a,b)
    fprintf('使用复化 Gauss - Legendre I公式求解 精确值为:%.7f 定积分值为:%.7f \n',[t,result(funIndex)])
end