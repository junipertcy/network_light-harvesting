% rate_ps_1 calculates average excitation lifetime and quantum yield
% OUTPUT: avg_ex_time_ps1, quantum_yield_ps1, rate_ps1, ener_ps1, inv_rate_ps1 (matrix structure)

loc = mg_1jb0_RC_center;
dip = dc_1jb0_original;

num = length(loc);
n_avg = 1;
% number of sampling realizations for static disorder
avg_ex_time_ps1 = [];
quantum_yield_ps1 = [];
rate_ps1 = [];
inv_rate_ps1 = [];
ener_ps1 = [];
disorder=0;

k_cs=1e12+1e9;


for nn = 1:n_avg
        ener_ps1{nn} = ener_1JB0_p2+whatsDE_rand(loc, disorder); 
        rate_ps1{nn} = rateM(loc, dip, ener_ps1{nn});
        inv_rate_ps1{nn} = inv(rate_ps1{nn});
        avg_ex_time_ps1(nn) = -num^-1*ones(1,num)*inv_rate_ps1{nn}*ones(num,1)
        quantum_yield_ps1(nn) = -num^-1*k_cs*[1 1 zeros(1,num-2)]*inv_rate_ps1{nn}*ones(num,1)

end


str_r_energy = int2str(n_avg);
str_disorder = int2str(disorder);

savefile = ['o_ps1_','disorder_',str_disorder,'_En_realns_',str_r_energy];
save(savefile,'avg_ex_time_ps1','quantum_yield_ps1');