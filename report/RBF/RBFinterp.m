function [y] = RBFinterp(xs, ys, x, RBFtype, R)

fPar = RBFparam(xs, ys, RBFtype, R);

if ~isempty(fPar)
    y = RBFeval(xs, x, fPar, RBFtype, R);
else
    y = [];
end
    
end
