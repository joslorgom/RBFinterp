function [fPar, M] = RBFparam(xs, ys, RBFtype, R)

if size(xs, 1) == size(ys, 1)
    
    Ns = size(xs, 1);
    Ms = size(ys, 2);
    dim = size(xs, 2);

    ncol = 1 + dim;
    r = zeros(Ns);

    for i = 1:Ns
        for j = (i+1):Ns
            r(i, j) = norm( xs(i, :) - xs(j, :) );
            r(j, i) = r(i, j);
        end
    end
    P = [ones(Ns, 1), xs];
    M = radialFunction(r, RBFtype, R);
    
    A = [M, P; P', zeros(ncol)];
    b = [ys; zeros(ncol, Ms)];

    fPar = A\b;
    
else
    
    fPar = [];
    M = [];
    
end
    
end