function [phi] = radialFunction(r, RBFtype, R)

r = r/R;

phi = zeros(size(r));

switch RBFtype
    case 'R1'
        phi = r;
    case 'R3'
        phi = r.^3;
    case 'TPS2'
        I = (r > 0);
        phi(I) = r(I).^2.*log(r(I));
    case 'Q'
        phi = 1 + r.^2;
    case 'MQ'
        phi = sqrt(1 + r.^2);
    case 'IMQ'
        phi = 1./sqrt(1 + r.^2);
    case 'IQ'
        phi = 1./(1 + r.^2);
    case 'GS'
        phi = exp(-r.^2);
    case 'CP_C0'
        I = (r < 1);
        phi(I) = (1 - r(I)).^2;
    case 'CP_C2'
        I = (r < 1);
        phi(I) = (1 - r(I)).^4.*(4*r(I) + 1);
    case 'CP_C4'
        I = (r < 1);
        phi(I) = (1 - r(I)).^6.*(35/3*r(I).^2 + 6*r(I) + 1);
    case 'CP_C6'
        I = (r < 1);
        phi(I) = (1 - r(I)).^8.*(32*r(I).^3 + 25*r(I).^2 + 8*r(I) + 1);
    case 'CTPS_C0'
        I = (r < 1);
        phi(I) = (1 - r(I)).^5;
    case 'CTPS_C1'
        I = (r < 1 & r > 0);
        phi(I) = 1 + 80/3*r(I).^2 - 40*r(I).^3 + 15*r(I).^4 - 8/3*r(I).^5 + 20*r(I).^2.*log(r(I));
        phi(r == 0) = 1;
    case 'CTPS_C2a'
        I = (r < 1 & r > 0);
        phi(I) = 1 - 30*r(I).^2 - 10*r(I).^3 + 45*r(I).^4 - 6*r(I).^5 - 60*r(I).^3.*log(r(I));
        phi(r == 0) = 1;
    case 'CTPS_C2b'
        I = (r < 1 & r > 0);
        phi(I) = 1 - 20*r(I).^2 + 80*r(I).^3 - 45*r(I).^4 -16*r(I).^5 + 60*r(I).^4.*log(r(I));
        phi(r == 0) = 1;
    otherwise
        phi = radialFunction(r, 'R1', R);
end

end