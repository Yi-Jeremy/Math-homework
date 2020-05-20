% 非线性方程的数值解法 7.2
clc,clear
close all
findex=1; %选择相应的方程
mindex=1; %选择第求解方法，1：牛顿迭代，2：拟牛顿迭代法
tol=1e-5; %求解精度
x0=[0,0,0;
    1,1,1;
    2,2,2;
    3,3,3;
    0,1,2;
    1,2,3;
    0,1,1];
for i=1:size(x0,1)
    x=x0(i,:);
    solution3(findex,mindex,tol,x)
    solution3(findex,mindex+1,tol,x)
    solution3(findex+1,mindex,tol,x)
    solution3(findex+1,mindex+1,tol,x)
end
