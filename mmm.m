clear
clc
x=[1 1.5 2 4.1 5 6];
y=[1 -1 1 -1 1 -1];
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

bv=n-3;

for i=2*(n-1)+1:2*(n-1)+4;
    tk=2*(n-1);
A(i,4*(i-10)-2)=1;
A(i,4*(i-10)-1)=2*(x(i-9));
A(i,4*(i-10))=3*(x(i-9))^(2);
A(i,4*(i-10)+2)=-1;
A(i,4*(i-10)+3)=-2*(x(i-9));
A(i,4*(i-10)+4)=-3*(x(i-9))^(2);
end
for i=2*(n-1)+5:2*(n-1)+8;
 tm=  2*(n-1)+4; 
A(i,4*(i-tm)-1)=2;
A(i,4*(i-tm))=6*(x(i-14));
A(i,4*(i-tm)+3)=-2;
A(i,4*(i-tm)+4)=-6*(x(i-14));
end

for i=4*(n-1)-1;
A(i,3)=2;
A(i,4)=6*(x(1));
end
for i=4*(n-1);
A(i,i-1)=2;
A(i,i)=6*(x(6));
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
xx=linspace(x(1),x(n),50);
plot(xx,csapi(x,y,xx),'k-',x,y,'ro')
% xx1=linspace(1,1.5,200);
% xx1=xx1';
% for i=1:200;
% j1(i,1)=T(1,1)+T(2,1)*xx1(i,1)+T(3,1)*xx1(i,1)^(2)+T(4,1)*xx1(i,1)^(3);
% end
% xx2=linspace(1.5,2,200);
% xx2=xx2';
% for i=1:200;
% j2(i,1)=T(5,1)+T(6,1)*xx2(i,1)+T(7,1)*xx2(i,1)^(2)+T(8,1)*xx2(i,1)^(3);
% end
% xx3=linspace(2,4.1,200);
% xx3=xx3';
% for i=1:200;
% j3(i,1)=T(9,1)+T(10,1)*xx3(i,1)+T(11,1)*xx3(i,1)^(2)+T(12,1)*xx3(i,1)^(3);
% end
% xx4=linspace(4.1,5,200);
% xx4=xx4';
% for i=1:200;
% j4(i,1)=T(13,1)+T(14,1)*xx4(i,1)+T(15,1)*xx4(i,1)^(2)+T(16,1)*xx4(i,1)^(3);
% end
% xx5=linspace(5,5,200);
% xx5=xx5';
% for i=1:200;
% j5(i,1)=T(17,1)+T(18,1)*xx5(i,1)+T(19,1)*xx5(i,1)^(2)+T(20,1)*xx5(i,1)^(3);
% end
% qq=j1-D{1,1};
% j1=j1';
% j2=j2';
% % for i=1:200
% %     if j3(i,1)>0;
% %         j3(i,1)=0;
% % %     end
% % end
% j3=j3';
% j4=j4';
% j5=j5';
% plot(xx1,j1);hold on;
% plot(xx2,j2);hold on;
% plot(xx3,j3);hold on;
% plot(xx4,j4);hold on;
% plot(xx5,j5);hold on;
% xx=linspace(1,5,50);
% 
% 
% 
% plot(xx,csapi(x,y,xx),'k-',x,y,'ro');


