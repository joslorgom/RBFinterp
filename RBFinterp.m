function [y] = RBFinterp(xs, ys, x, RBFtype, R)

%RBFinterp  Radial Basis Functions interpolation.
%
%   y = RBFinterp(xs, ys, x, RBFtype, R) interpolates to find y, the values
%   of the function y=f(x) at the points x.
%
%   Xs must be a matrix of size [N,Dx], with N the number of data points
%   and Dx the dimension of the points in xs and x.
%
%   Ys must be a matrix of size [N,Dy], with N the number of known values 
%   at points in Xs, and Dy the dimension of the y values.
%
%   X must be a matrix of size [M,Dx], with M the number of query points.
%
%   RBFtype specifies the radial basis functions (RBF) to be used. 
%
%   The available global support RBFs are:
%
%       'R1'    - linear spline
%       'R3'    - cubic spline
%       'TPS2'  - thin plate spline
%       'Q'     - quadric
%       'MQ'    - multiquadric
%       'IMQ'   - inverse multiquadric
%       'IQ'    - inverse quadric
%       'GS'    - Gauss
%
%   The available compact support RBFs are (see Wendland H., Konstruktion 
%   und Untersuchung radialer Basisfunktionen mit kompaktem Träger. PhD 
%   thesis, Göttingen, Georg-August-Universität zu Göttingen, Diss, 1996):
%
%       'CP_C0'
%       'CP_C2'
%       'CP_C4'
%       'CP_C6'
%       'CTPS_C0'
%       'CTPS_C1'
%       'CTPS_C2a'
%       'CTPS_C2b'
%
%   R is either the support radius for the compact support RBFs or a
%   parameter to make the distance values dimensionless for the global
%   support RBFs.

% Compute interpolation parameters
fPar = RBFparam(xs, ys, RBFtype, R);

if ~isempty(fPar)
    % Evaluate interpolation function
    y = RBFeval(xs, x, fPar, RBFtype, R);
else
    y = [];
end
    
end