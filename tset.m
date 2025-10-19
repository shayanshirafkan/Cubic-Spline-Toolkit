clear
clc
M = imread('C:\Users\pascal\Desktop\23.jpg');
M=rgb2gray(M);
[c,d]=size(M);
for i=1:c;
for j=1:c;
n(i,j)=M(i,j);
end
end
M=n;
[c,d]=size(M);

% [A,B,C,D]=dwt2(M,'haar');
% 
% A=uint8(A);
% B=uint8(B);
% C=uint8(C);
% D=uint8(D);
% figure;hold on;
% subplot(2,2,1);
% imshow(A);
% subplot(2,2,2);
% imshow(B);
% subplot(2,2,3);
% imshow(C);
% subplot(2,2,4);
% imshow(D);
% 
 M=double(M);
v=zeros(d/2,d/2);

for i=1:d/2;
v(i,2*i-1)=1/sqrt(2);
v(i,2*i)=1/sqrt(2);
end

w=zeros(d/2,d/2);
for i=1:d/2;
w(i,2*i-1)=1/sqrt(2);
w(i,2*i)=-1/sqrt(2);
end
% for ii=1:c;
% G(ii,:)=g(ii,:);
% end
f=0;
for i=1:c/2;
for j=1:c/2;
g=v(i,:)'*v(j,:);
a=M.*g;
a=sum(sum(a));
b=a*g;
f=f+b;
end
end
% for i=1:c/2;
% f2(:,i)=f(:,2*i-1)+f(:,2*i);
% end
% for i=1:c/2;
% f3(i,:)=f2(2*i-1,:);
% end
% f3=uint8(f3);
% 

q=0;
for i=1:c/2;
for j=1:d/2;
g=v(i,:)'*w(j,:);
h=M.*g;
h=sum(sum(h));
b=h*g;
q=q+b;
end
end


% for i=1:c/2;
% q2(:,i)=q(:,2*i-1)+q(:,2*i);
% end
% for i=1:c/2;
% q3(i,:)=q2(2*i-1,:);
% end
% q3=uint8(q3);





r=0;
for i=1:c/2;
for j=1:d/2;
g=w(i,:)'*v(j,:);
for ii=1:c;
G(ii,:)=g(ii,:);
end
vv=M.*G;
vv=sum(sum(vv));
b=vv*g;
r=r+b;
end
end
% 
% for i=1:c/2;
% r2(:,i)=r(:,2*i-1)+r(:,2*i);
% end
% for i=1:c/2;
% r3(i,:)=r2(2*i-1,:);
% end
% r3=uint8(r3);
% 




p=0;
for i=1:c/2;
for j=1:d/2;
g=w(i,:)'*w(j,:);
for ii=1:c;
G(ii,:)=g(ii,:);
end
pp=M.*G;
pp=sum(sum(pp));
b=pp*g;
p=p+b;
end
end

% for i=1:c/2;
% p2(:,i)=p(:,2*i-1)+p(:,2*i);
% end
% for i=1:c/2;
% p3(i,:)=p2(2*i-1,:);
% end
% p3=uint8(p3);




hn=f+r+q+p;
figure;hold on;
subplot(2,2,1);
imshow(f);
subplot(2,2,2);
imshow(q);
subplot(2,2,3);
imshow(r);
subplot(2,2,4);
imshow(p);
h=r+p+q;
% 
% f=uint8(f);
% q=uint8(q);
% r=uint8(r);
% p=uint8(p);
% figure;hold on;
% subplot(2,2,1);
% imshow(f);
% subplot(2,2,2);
% imshow(q);
% subplot(2,2,3);
% imshow(r);
% subplot(2,2,4);
% imshow(p);
%% 2
v1=zeros(d/4,d/4);
for i=1:d/4;
v1(i,4*i-3)=1/2;
v1(i,4*i-2)=1/2;
v1(i,4*i-1)=1/2;
v1(i,4*i)=1/2;
end

w1=zeros(d/4,d/4);
for i=1:d/4;
w1(i,4*i-3)=1/2;
w1(i,4*i-2)=1/2;
w1(i,4*i-1)=-1/2;
w1(i,4*i)=-1/2;
end

f1=0;
for i=1:d/4;
for j=1:d/4;
g=v1(i,:)'*v1(j,:);
a=M.*g;
a=sum(sum(a));
b=a*g;
f1=f1+b;
end
end


q1=0;
for i=1:c/4;
for j=1:d/4;
g=v1(i,:)'*w1(j,:);
h=M.*g;
h=sum(sum(h));
b=h*g;
q1=q1+b;
end
end


r1=0;
for i=1:c/4;
for j=1:d/4;
g=w1(i,:)'*v1(j,:);
for ii=1:c;
G(ii,:)=g(ii,:);
end
vv=M.*G;
vv=sum(sum(vv));
b=vv*g;
r1=r1+b;
end
end


p1=0;
for i=1:c/4;
for j=1:d/4;
g=w1(i,:)'*w1(j,:);
for ii=1:c;
G(ii,:)=g(ii,:);
end
pp=M.*G;
pp=sum(sum(pp));
b=pp*g;
p1=p1+b;
end
end


h1=r1+p1+q1;

figure;hold on;
subplot(2,2,1);
imshow(f1);
subplot(2,2,2);
imshow(q1);
subplot(2,2,3);
imshow(r1);
subplot(2,2,4);
imshow(p1);
%% 3
v2=zeros(d/8,d/8);
for i=1:d/8;
v2(i,8*i-7)=(1/sqrt(2))^(3);
v2(i,8*i-6)=(1/sqrt(2))^(3);
v2(i,8*i-5)=(1/sqrt(2))^(3);
v2(i,8*i-4)=(1/sqrt(2))^(3);
v2(i,8*i-3)=(1/sqrt(2))^(3);
v2(i,8*i-2)=(1/sqrt(2))^(3);
v2(i,8*i-1)=(1/sqrt(2))^(3);
v2(i,8*i)=(1/sqrt(2))^(3);
end
w2=zeros(d/8,d/8);
for i=1:d/8;
w2(i,8*i-7)=(1/sqrt(2))^(3);
w2(i,8*i-6)=(1/sqrt(2))^(3);
w2(i,8*i-5)=(1/sqrt(2))^(3);
w2(i,8*i-4)=(1/sqrt(2))^(3);
w2(i,8*i-3)=-(1/sqrt(2))^(3);
w2(i,8*i-2)=-(1/sqrt(2))^(3);
w2(i,8*i-1)=-(1/sqrt(2))^(3);
w2(i,8*i)=-(1/sqrt(2))^(3);
end
f2=0;
for i=1:1;
for j=1:1;
g=v2(i,:)'*v2(j,:);
a=M.*g;
a=sum(sum(a));
b=a*g;
f2=f2+b;
end
end


q2=0;
for i=1:c/8;
for j=1:d/8;
g=v2(i,:)'*w2(j,:);
h=M.*g;
h=sum(sum(h));
b=h*g;
q2=q2+b;
end
end


r2=0;
for i=1:c/8;
for j=1:d/8;
g=w2(i,:)'*v2(j,:);
for ii=1:c;
G(ii,:)=g(ii,:);
end
vv=M.*G;
vv=sum(sum(vv));
b=vv*g;
r2=r2+b;
end
end


p2=0;
for i=1:c/8;
for j=1:d/8;
g=w2(i,:)'*w2(j,:);
for ii=1:c;
G(ii,:)=g(ii,:);
end
pp=M.*G;
pp=sum(sum(pp));
b=pp*g;
p2=p2+b;
end
end



figure;hold on;
subplot(2,2,1);
imshow(f2);
subplot(2,2,2);
imshow(q2);
subplot(2,2,3);
imshow(r2);
subplot(2,2,4);
imshow(p2);
%% 4
v3=zeros(d/16,d/16);
for i=1:d/16;
v3(i,16*i-15)=(1/sqrt(2))^(4);
v3(i,16*i-14)=(1/sqrt(2))^(4);
v3(i,16*i-13)=(1/sqrt(2))^(4);
v3(i,16*i-12)=(1/sqrt(2))^(4);
v3(i,16*i-11)=(1/sqrt(2))^(4);
v3(i,16*i-10)=(1/sqrt(2))^(4);
v3(i,16*i-9)=(1/sqrt(2))^(4);
v3(i,16*i-8)=(1/sqrt(2))^(4);
v3(i,16*i-7)=(1/sqrt(2))^(4);
v3(i,16*i-6)=(1/sqrt(2))^(4);
v3(i,16*i-5)=(1/sqrt(2))^(4);
v3(i,16*i-4)=(1/sqrt(2))^(4);
v3(i,16*i-3)=(1/sqrt(2))^(4);
v3(i,16*i-2)=(1/sqrt(2))^(4);
v3(i,16*i-1)=(1/sqrt(2))^(4);
v3(i,16*i)=(1/sqrt(2))^(4);
end

w3=zeros(d/16,d/16);
for i=1:d/16;
w3(i,16*i-15)=(1/sqrt(2))^(4);
w3(i,16*i-14)=(1/sqrt(2))^(4);
w3(i,16*i-13)=(1/sqrt(2))^(4);
w3(i,16*i-12)=(1/sqrt(2))^(4);
w3(i,16*i-11)=(1/sqrt(2))^(4);
w3(i,16*i-10)=(1/sqrt(2))^(4);
w3(i,16*i-9)=(1/sqrt(2))^(4);
w3(i,16*i-8)=(1/sqrt(2))^(4);
w3(i,16*i-7)=-(1/sqrt(2))^(4);
w3(i,16*i-6)=-(1/sqrt(2))^(4);
w3(i,16*i-5)=-(1/sqrt(2))^(4);
w3(i,16*i-4)=-(1/sqrt(2))^(4);
w3(i,16*i-3)=-(1/sqrt(2))^(4);
w3(i,16*i-2)=-(1/sqrt(2))^(4);
w3(i,16*i-1)=-(1/sqrt(2))^(4);
w3(i,16*i)=-(1/sqrt(2))^(4);
end
f3=0;
for i=1:c/16;
for j=1:c/16;
g=v3(i,:)'*v3(j,:);
a=M.*g;
a=sum(sum(a));
b=a*g;
f3=f3+b;
end
end


q3=0;
for i=1:c/16;
for j=1:d/16;
g=v3(i,:)'*w3(j,:);
h=M.*g;
h=sum(sum(h));
b=h*g;
q3=q3+b;
end
end


r3=0;
for i=1:c/16;
for j=1:d/16;
g=w3(i,:)'*v3(j,:);
for ii=1:c;
G(ii,:)=g(ii,:);
end
vv=M.*G;
vv=sum(sum(vv));
b=vv*g;
r3=r3+b;
end
end


p3=0;
for i=1:c/16;
for j=1:d/16;
g=w3(i,:)'*w3(j,:);
for ii=1:c;
G(ii,:)=g(ii,:);
end
pp=M.*G;
pp=sum(sum(pp));
b=pp*g;
p3=p3+b;
end
end

f3=uint8(f3);
q3=uint8(q3);
r3=uint8(r3);
p3=uint8(p3);
figure;hold on;
subplot(2,2,1);
imshow(f3);
subplot(2,2,2);
imshow(q3);
subplot(2,2,3);
imshow(r3);
subplot(2,2,4);
imshow(p3);
%% 5
v4=zeros(d/32,d/32);
for i=1:d/32;
v4(i,32*i-31)=(1/sqrt(2))^(5);
v4(i,32*i-30)=(1/sqrt(2))^(5);
v4(i,32*i-29)=(1/sqrt(2))^(5);
v4(i,32*i-28)=(1/sqrt(2))^(5);
v4(i,32*i-27)=(1/sqrt(2))^(5);
v4(i,32*i-26)=(1/sqrt(2))^(5);
v4(i,32*i-25)=(1/sqrt(2))^(5);
v4(i,32*i-24)=(1/sqrt(2))^(5);
v4(i,32*i-23)=(1/sqrt(2))^(5);
v4(i,32*i-22)=(1/sqrt(2))^(5);
v4(i,32*i-21)=(1/sqrt(2))^(5);
v4(i,32*i-20)=(1/sqrt(2))^(5);
v4(i,32*i-19)=(1/sqrt(2))^(5);
v4(i,32*i-18)=(1/sqrt(2))^(5);
v4(i,32*i-17)=(1/sqrt(2))^(5);
v4(i,32*i-16)=(1/sqrt(2))^(5);
v4(i,32*i-15)=(1/sqrt(2))^(5);
v4(i,32*i-14)=(1/sqrt(2))^(5);
v4(i,32*i-13)=(1/sqrt(2))^(5);
v4(i,32*i-12)=(1/sqrt(2))^(5);
v4(i,32*i-11)=(1/sqrt(2))^(5);
v4(i,32*i-10)=(1/sqrt(2))^(5);
v4(i,32*i-9)=(1/sqrt(2))^(5);
v4(i,32*i-8)=(1/sqrt(2))^(5);
v4(i,32*i-7)=(1/sqrt(2))^(5);
v4(i,32*i-6)=(1/sqrt(2))^(5);
v4(i,32*i-5)=(1/sqrt(2))^(5);
v4(i,32*i-4)=(1/sqrt(2))^(5);
v4(i,32*i-3)=(1/sqrt(2))^(5);
v4(i,32*i-2)=(1/sqrt(2))^(5);
v4(i,32*i-1)=(1/sqrt(2))^(5);
v4(i,32*i)=(1/sqrt(2))^(5);
end



w4=zeros(d/32,d/32);
for i=1:d/32;
w4(i,32*i-31)=(1/sqrt(2))^(5);
w4(i,32*i-30)=(1/sqrt(2))^(5);
w4(i,32*i-29)=(1/sqrt(2))^(5);
w4(i,32*i-28)=(1/sqrt(2))^(5);
w4(i,32*i-27)=(1/sqrt(2))^(5);
w4(i,32*i-26)=(1/sqrt(2))^(5);
w4(i,32*i-25)=(1/sqrt(2))^(5);
w4(i,32*i-24)=(1/sqrt(2))^(5);
w4(i,32*i-23)=(1/sqrt(2))^(5);
w4(i,32*i-22)=(1/sqrt(2))^(5);
w4(i,32*i-21)=(1/sqrt(2))^(5);
w4(i,32*i-20)=(1/sqrt(2))^(5);
w4(i,32*i-19)=(1/sqrt(2))^(5);
w4(i,32*i-18)=(1/sqrt(2))^(5);
w4(i,32*i-17)=(1/sqrt(2))^(5);
w4(i,32*i-16)=(1/sqrt(2))^(5);
w4(i,32*i-15)=-(1/sqrt(2))^(5);
w4(i,32*i-14)=-(1/sqrt(2))^(5);
w4(i,32*i-13)=-(1/sqrt(2))^(5);
w4(i,32*i-12)=-(1/sqrt(2))^(5);
w4(i,32*i-11)=-(1/sqrt(2))^(5);
w4(i,32*i-10)=-(1/sqrt(2))^(5);
w4(i,32*i-9)=-(1/sqrt(2))^(5);
w4(i,32*i-8)=-(1/sqrt(2))^(5);
w4(i,32*i-7)=-(1/sqrt(2))^(5);
w4(i,32*i-6)=-(1/sqrt(2))^(5);
w4(i,32*i-5)=-(1/sqrt(2))^(5);
w4(i,32*i-4)=-(1/sqrt(2))^(5);
w4(i,32*i-3)=-(1/sqrt(2))^(5);
w4(i,32*i-2)=-(1/sqrt(2))^(5);
w4(i,32*i-1)=-(1/sqrt(2))^(5);
w4(i,32*i)=-(1/sqrt(2))^(5);
end

f4=0;
for i=1:c/32;
for j=1:d/32;
g=v4(i,:)'*v4(j,:);
a=M.*g;
a=sum(sum(a));
b=a*g;
f4=f4+b;
end
end


q4=0;
for i=1:c/32;
for j=1:d/32;
g=v4(i,:)'*w4(j,:);
h=M.*g;
h=sum(sum(h));
b=h*g;
q4=q4+b;
end
end


r4=0;
for i=1:c/32;
for j=1:d/32;
g=w4(i,:)'*v4(j,:);
for ii=1:c;
G(ii,:)=g(ii,:);
end
vv=M.*G;
vv=sum(sum(vv));
b=vv*g;
r4=r4+b;
end
end


p4=0;
for i=1:c/32;
for j=1:d/32;
g=w4(i,:)'*w4(j,:);
for ii=1:c;
G(ii,:)=g(ii,:);
end
pp=M.*G;
pp=sum(sum(pp));
b=pp*g;
p4=p4+b;
end
end
f4=uint8(f4);
q4=uint8(q4);
r4=uint8(r4);
p4=uint8(p4);
figure;hold on;
subplot(2,2,1);
imshow(f4);
subplot(2,2,2);
imshow(q4);
subplot(2,2,3);
imshow(r4);
subplot(2,2,4);
imshow(p4);