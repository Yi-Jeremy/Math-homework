function solution3(findex,mindex,tol,x0)
fstr={'牛顿迭代法','拟牛顿迭代法'};
if mindex==1
    [x,n,T,x0]=newtonpro(tol,findex,x0); %牛顿迭代法
elseif mindex==2
    [x,n,T,x0]=broyden1(tol,findex,x0); %拟牛顿迭代法
end
fprintf('使用%s，',[fstr{mindex}])
fprintf('求解方程 %d,初值为 %s \n',findex,num2str(x0))
fprintf('耗时 %.5f S，迭代次数为%d，精度为%f \n',[T,n,tol])
fprintf('最终求解结果为 %s \n \n',num2str(x))
