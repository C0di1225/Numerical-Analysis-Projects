% Conditionally Stable Finite
% Difference for solving
% ut=c^2uxx where u(x,0)=f(x)
%  and u(x,0)=u(x,1)=0
% Stable when L < 0.5

c = 1;

% number of x points
N = 10;

% x spacing
k = 1/N;

% space domain
x=linspace(0,1,N)';

% Maximum Time
T=1;

% Numer of Time Points
% M = 10000
% About the Minimum "M" required
% for stability
M=ceil(2*T*c^2*N^2) + 1;

% t spacing
h = T/M;

% Initializing Domain Grid
A=zeros(N,M);

% Intial U Prodile
f = @(x) 4*x.*(1-x);

% Stability Parameter
L = (h*c^2)/(k^2)

if (L < 0.5)
    %u(x,0)=f(x)
    A(:,1)=f(x);
    
    %u(x,0)=u(x,1)=0
    A(1,:)=0;
    A(end,:)=0;
    
    for j = 2:M-1
        for i = 2:N-1
        A(i,j)=L*(A(i-1,j-1)+A(i+1,j-1))+(1-2*L)*A(i,j-1);
        endfor
    endfor
endif
if (L = 0.5) || (L > 0.5)
    disp("Parameter L needs to be smaller than 1/2 for the scheme to be stable.")
endif
