function c = fdcoeffV(k,xbar,x)
    format long
    n = length(x); % number of given function values
    A = ones(n,n); % 
    xrow = (x(:)-xbar)';
    for i = 2:n
        A(i,:) = (xrow.^(i-1))./factorial(i-1);
    endfor
    b = zeros(n,1);
    b(k+1) = 1;
    c = A\b;
    c = c';
endfunction

% kth order approximation scheme given n points
% derivative is given by
% c*u(x) where c and x are vectors like
% for example
% u' approx c1*u1+c2*u2