% rate_ps_1_rand calculates average excitation lifetime and quantum
% yield for PSI with randomized energy. NEEDS: rand_ener
% OUTPUT: avg_ex_time_ps1, quantum_yield_ps1, rate_ps1, ener_ps1, inv_rate_ps1 (matrix structure)

loc = mg_1jb0_RC_center;
dip = dc_1jb0_original;

num = length(loc);
n_avg = 1000;
% number of sampling realizations for static disorder
avg_ex_time_ps1_rand = [];
quantum_yield_ps1_rand = [];
rate_ps1 = [];
inv_rate_ps1 = [];
ener_ps1 = [];


k_cs=1e12+1e9;

for mm=1:5
    for nn = 1:n_avg
        inv_rate_ps1{nn} = inv(rateM(loc, dip, rand_ener(:,nn,mm)));
        avg_ex_time_ps1_rand(mm,nn) = -num^-1*ones(1,num)*inv_rate_ps1{nn}*ones(num,1)
        quantum_yield_ps1_rand(mm,nn) = -num^-1*k_cs*[1 1 zeros(1,num-2)]*inv_rate_ps1{nn}*ones(num,1);

    end
end


savefile = ['o_ps1_rand'];
save(savefile,'avg_ex_time_ps1_rand','quantum_yield_ps1_rand');