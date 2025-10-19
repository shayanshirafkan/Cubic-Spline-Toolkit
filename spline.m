clear
clc
% n=input('n');
% xx=zeros(1,n);
% y=zeros(1,n);
% for i=1:n;
%     xx(i)=input('x');
%     y(i)=input('x');
% end
xx=[1 1.5 2 4.1 5];
y=[1 -1 1 -1 1];
n=5;
h=zeros(1,n);
for j=1:n-1;
  h(j+1)=xx(j+1)-xx(j);
end
d=zeros(n-2,1);
for j=1:n-2;
    d(j,1)=6/(h(j+1)+h(j+2))*((y(j+2)-y(j+1))/h(j+2)-(y(j+1)-y(j))/h(j+1));
end
landa=zeros(1,n);
for j=1:n-3;
    landa(j)=h(j+2)/(h(j+1)+h(j+2));
end

mu=zeros(1,n);

for j=1:n-3;
    mu(j+1)=h(j+1)/(h(j+2)+h(j+3));
end

A=zeros(n-2);



for i=1:n-2;
    A(i,i)=2;
    if i < n-2;
         A(i,i+1)=landa(i);
    end
    if i > 1;
         A(i,i-1)=mu(i);
    end
end
N=inv(A)*d;
M=zeros(1,n);
for i=2:n-1;
    M(i)=N(i-1,1);
end
e=zeros(1,n-1);
f=zeros(1,n-1);


for j=1:n-1;
    e(j)=((y(j+1)-y(j))/h(j+1))-(h(j+1)/6)*(M(j+1)-M(j));
    f(j)=y(j)-((h(j+1)^2)*M(j))/6;
end

syms x
T=zeros(1,n-1);
T=vpa(x);


for j=1:n-1;
    T(j,1)=(((x-xx(j+1))^3)/(-6*h(j+1)))*M(j)+(((x-xx(j))^3)/(6*h(j+1)))*M(j+1)+e(j)*(x-xx(j))+f(j);
end
expand(simplify(T));
for j=1:n-1;
    disp(T(j,1));
end
for j=1:n-1;
    ezplot(T(j,1));
    hold on
end


