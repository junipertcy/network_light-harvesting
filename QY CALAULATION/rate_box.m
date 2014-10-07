% rate_box calculates average excitation lifetime and quantum yield
% OUTPUT: avg_ex_time, quantum_yield, rate, ener, inv_rate (cell array structure)

tic

k_cs=1e12+1e9;


avg_ex_time = [];
quantum_yield = [];
ener = [];
rate = [];
inv_rate = [];

% i over cell array index (number of nodes)
for i=9:9
    
    % j over realizations
    for j =1:10000

    index = j;
    loc = rc{i}(:,:,index);
    dip = dc{i}(:,:,index);

    num = length(loc);
    
    % number of energy realizations for static disorder
    n_avg = 1;
    disorder=0;

        for nn=1:n_avg
            ener{j,nn} = [ener_1JB0_p6(1:6); 13979*ones(10*i+0,1)] +whatsDE_rand(loc, disorder);
            rate{j,nn} = rateM( loc, dip, ener{j,nn});
            inv_rate{j,nn} = inv(rate{j,nn});
            avg_ex_time{i}(j,nn) = -num^-1*ones(1,num)*inv_rate{j,nn}*ones(num,1)
            quantum_yield{i}(j,nn) = -num^-1*k_cs*[1 1 zeros(1,num-2)]*inv_rate{j,nn}*ones(num,1);

         end
    end
end

toc

%str_n_node = int2str(n_node);
%str_r_node = int2str(j);
%str_r_energy = int2str(n_avg);
%str_disorder = int2str(disorder);

%savefile = ['o_box_p2_','maxN_',str_n_node,'+2','_realn_',str_r_node,'disorder_',str_disorder,'En_realns_',str_r_energy];
%save(savefile,'avg_ex_time','quantum_yield','rate','ener','inv_rate');