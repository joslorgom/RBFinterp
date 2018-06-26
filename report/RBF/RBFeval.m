function [y] = RBFeval(xs, x, fPar, RBFtype, R)

Ns = size(xs, 1);
dim = size(xs, 2);

if size(x, 2) == dim && size(fPar, 1) == Ns + dim + 1
    
    N = size(x, 1);
    
    r = zeros(N, Ns);
    for i = 1:N
        for j = 1:Ns
            r(i, j) = norm( x(i, :) - xs(j, :) );
        end
    end
    
    P = [ones(N, 1), x];
    M = radialFunction(r, RBFtype, R);
    
    y = [M, P]*fPar;
    
else
    
    y = [];
    
end

end