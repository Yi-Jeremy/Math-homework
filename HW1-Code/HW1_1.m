clc,clear all
close all
% 第二章数值实验1 2.1
H=[];
a = - 5; 
b = 5;
index=2:2:10;
figure(1);
for i=1:length(index)
    Nd=index(i);
    x0 = linspace( a , b, Nd + 1 ) ;
    y0 = x0./(1 + x0 .^4);
    x = a: 0.01: b; 
    y = Lagrange( x0 , y0, x) ;
    f=fplot(@(x)x ./(1 +  x .^4), [ a b] ,'k-*','linewidth',2) ;
    hold on;
    h=plot( x, y,'.-','linewidth',2,'Color',rand(1,3)) ;
    H=[H,h];
    xlabel('x') ; 
    ylabel('y') ;
end
H=[H,f];
title('y=f(x) o- and y=Spline(x) --')
leStr=cell(1,size(index,2)+1);
for i=1:size(index,2)
   leStr(i)={['Nd = ',num2str(index(i))]};
end
leStr(end)={'y=f(x)'};
hl=legend(H(:),leStr);
%ylim([-1 3])
set(hl,'box','off')

%%%%%%%%%%第二个函数%%%%%%%%%%
figure(2)
H=[];
for i=1:length(index)
    Nd=index(i);
    x0 = linspace( a , b, Nd + 1 ) ;
    y0 = atan(x0);
    x = a: 0.01: b; 
    y = Lagrange( x0 , y0, x) ;
    f=fplot(@(x)atan(x) ,'k-*','linewidth',2) ;
    hold on;
    h=plot( x, y,'.-','linewidth',2,'Color',rand(1,3)) ;
    H=[H,h];
    xlabel('x') ; 
    ylabel('y') ;
end
H=[H,f];
title('y=f(x) o- and y=Spline(x) --')
leStr=cell(1,size(index,2)+1);
for i=1:size(index,2)
   leStr(i)={['Nd = ',num2str(index(i))]};
end
leStr(end)={'y=f(x)'};
hl=legend(H(:),leStr,'Location','northwest');
%ylim([-1 3])
set(hl,'box','off')


