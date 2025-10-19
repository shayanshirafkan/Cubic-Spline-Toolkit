clear
clc
% x=[1 1.5 2 4.1 5];
% y=[1 -1 1 -1 1];

x=linspace(0,2*pi,6);
y=sin(x);
x=x';
y=y';
[n,nn]=size(x);
f=zeros(4*(n-1),1);
f(1,1)=y(1,1);
f(2*(n-1),1)=y(n,1);
 for i=2:5;
f(2*i-2,1)=y(i);
f(2*i-1,1)=y(i);
 end


% f=[1;-1;-1;1;1;-1;-1;1;1;-1;0;0;0;0;0;0;0;0;0;0];
for i=1:n-1;
% A(i,1)=sh(i,1);
A(2*i-1,4*i-3)=1 ;
A(2*i-1,4*i-2)=x(i,1) ;
A(2*i-1,4*i-1)=x(i,1)^(2) ;
A(2*i-1,4*i)=x(i,1)^(3);
A(2*i,4*i-3)=1 ;
A(2*i,4*i-2)=x(i+1,1) ;
A(2*i,4*i-1)=x(i+1,1)^(2) ;
A(2*i,4*i)=x(i+1,1)^(3);
end



for i=2*(n-1)+1:2*(n-1)+n-2;
    tk=2*(n-1);
A(i,4*(i-tk)-2)=1;
A(i,4*(i-tk)-1)=2*(x(i-(tk-1)));
A(i,4*(i-tk))=3*(x(i-(tk-1)))^(2);
A(i,4*(i-tk)+2)=-1;
A(i,4*(i-tk)+3)=-2*(x(i-(tk-1)));
A(i,4*(i-tk)+4)=-3*(x(i-(tk-1)))^(2);
end
for i=2*(n-1)+n-1:2*(n-1)+n-1+n-3;
tm=  2*(n-1)+n-2; 
A(i,4*(i-tm)-1)=2;
A(i,4*(i-tm))=6*(x(i-(tm-1)));
A(i,4*(i-tm)+3)=-2;
A(i,4*(i-tm)+4)=-6*(x(i-(tm-1)));
end

for i=4*(n-1)-1;
A(i,3)=2;
A(i,4)=6*(x(1));
end
for i=4*(n-1);
A(i,i-1)=2;
A(i,i)=6*(x(n));
end
T=inv(A)*f;
for i=1:n-1;
C{i,1}=linspace(x(i),x(i+1),200);
xx10=C{i,1}';
for j=1:200;
p(j,1)=T(4*i-3,1)+T(4*i-2,1)*xx10(j,1)+T(4*i-1,1)*xx10(j,1)^(2)+T(4*i,1)*xx10(j,1)^(3);
end
D{i,1}=p;
end  

for j=1:n-1;
    v=C{j,1}';
 plot(v,D{j,1});hold on;   
end
xlabel('x')
ylabel('y')
title('Cubic Spilne');

xx=linspace(x(1),x(n),200);
plot(xx,csapi(x,y,xx),'k-',x,y,'ro')
% plot(x,y,'g');
legend('Cubic Spilne','Cubic Spilne of Matlab');
title('Cubic Spilne');