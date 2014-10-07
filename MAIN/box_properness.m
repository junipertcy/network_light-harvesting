% box_properness.m  script that plot the average pairwise
% Mg-Mg distance distribution of the random network and that of the
% natural PSI structure.
%
% PRE-LOAD: mg_1jb0_RC_center (PSI MG-location data), rcc
% OUTPUT: figure


tic
%rcc=rc_sph{9};
% number of configurations in the ensemble
all_ind=10000;

pdist_rc=[];
for ii=1:all_ind
pdist_rc=[pdist_rc pdist(rcc(:,:,ii))];
end

pdist_ps1=pdist(mg_1jb0_RC_center);


[a_rand b_rand]=hist(pdist_rc,100);
[a_ps1 b_ps1]=hist(pdist_ps1,100);


% str_d_x = int2str(d_x);
% str_d_y = int2str(d_y);
% str_d_z = int2str(d_z);
% 
% line_name = [str_d_x,'*',str_d_y,'*',str_d_z];


hh=line(b_rand,a_rand/trapz(b_rand,a_rand));
% set(hh,{'DisplayName'},{line_name})
hold on
line(b_ps1,a_ps1/trapz(b_ps1,a_ps1));
hold off
toc