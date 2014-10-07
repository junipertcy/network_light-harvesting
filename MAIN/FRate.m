function [ fr12 fr21 ] = FRate( r1, r2, mu1, mu2, en1, en2 )
% FRate computes Foerster EET rate of two sites, unit ???

lw = 185;           
% linewidth, unit cm^-1
reorg = 75;        
% reorganization energy, unit cm^-1 
hbar = 5.307e-12; % 1 cm^-1 = 1.986e-23 J
% reduced Planck const in unit of cm^-1*s
% c_c = 299792458;

coup = DipoleCoupling(r1, r2, mu1, mu2);    
% unit: cm^-1

% fr12: 2-to-1 rate
% fr21: 1-to-2 rate
% check JPCB 2000, 104, 1854
% foerster rate: k = 2*pi/hbar*coupling^2*(integral of normalized
% lineshapes)

fr12 = 2*pi/hbar*coup^2*(4*pi*(lw)^2)^-0.5*exp(-(2*reorg+en1-en2)^2/(4*(lw)^2));
fr21 = 2*pi/hbar*coup^2*(4*pi*(lw)^2)^-0.5*exp(-(2*reorg+en2-en1)^2/(4*(lw)^2));


end


% Possible parameters that fits in Fleming's trapping time distribution
% 183,80; 170,72