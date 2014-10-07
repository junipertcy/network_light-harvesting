function [ J ] = DipoleCoupling( r1, r2, mu1, mu2 )
% DipoleCoupling computes dipole coupling strength, in units of cm^-1
% input parameters:
% r1, r2: r-vector of sites in cartesian coordinates
% mu1, mu2: dipole vector of sites in cartesian coordinates

C = 9*1e9; 
% constant 1/(4*pi*epsilon_0)
hc = 6.626*3e-24; 
% energy unit from J to cm^-1
r21 = (r2-r1)*1e-10;  
% separation distance in units of m.
r21r = r21/norm(r21);
r21 = norm(r21);

% mu = 4.788088*3.34*1e-30; % Follow JCP 2004, 120, 23: Schultens group
mu = 4.3653*3.34*1e-30;

% mu = 5.2384*3.34*1e-30; % PSI study by GR Fleming's group, Biophys J., 85, 140 (2003).
% mu = 3.5*3.34e-30; % test case


% electric dipole, in units of C*m 
% Note this value varies considerably.
% This value of dipole strength (5.2384*3.34*1e-30) corresponds to coupling of 137cm^-1
% when the parallel dipole pair is separated by 10 angs. 

J = C*mu^2*(sum(mu1.*mu2)-3*sum(mu1.*r21r)*sum(mu2.*r21r))/(r21^3)/hc;
% electric diople coupling, in units of cm^-1