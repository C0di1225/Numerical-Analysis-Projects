% function u(x,0) = f(x)
f = @(x) sin(pi*x);
%endpoint
l = 1;
%Max Time
T = 1;
% constant
alpha = 1;
% integers m>=3; N>=1
m = 15
N = 15
h = l/m
k = T/N
w = zeros(m+1,1/k+1);
lambda = alpha^2*k/h^2;
x = 0:h:l;
for i = 1:m+1
    w(i,1) = f(x(i));
endfor
w;
A = zeros(m+1,m+1);
for i = 1:length(A)
    A(i,i) = 1+2*lambda;
endfor
for i = 2:length(A)
    A(i,i-1) = -lambda;
endfor
for i = 1:length(A)-1
    A(i,i+1) = -lambda;
endfor
A;
for i = 2:1/k+1
w(1:m+1,i) = linsolve(A,w(1:m+1,i-1));
endfor
w;

u = @(t,x) exp(-pi^2*t)*sin(pi*x);

hold on
for i = 1:1/k+1
    plot(0:h:1,w(:,i),'b')
    %plot(0:h:1,u(i*k,0:h:1),'r')
endfor
hold off
error = max(abs(exp(-pi^2*1)*sin(pi*x)-w(:,end)))
