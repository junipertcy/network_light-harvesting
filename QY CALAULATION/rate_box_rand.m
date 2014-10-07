% rate_box_rand generates outputs with static disorder
% BACKGROUND VAR: quantum_yield{9}, rc{9}, dc{9}, rand_ener_p2

% sort the highest 5 and the lowerest 5 QY-indices to plot
    
[sqy_a sqy_b]=sort(quantum_yield{9},'ascend');

tic

k_cs=1e12+1e9;

avg_ex_time = [];
quantum_yield = [];

inv_rate = [];

    % robustness study for i=9 in the cell array
    % j over realizations
for j =1:5
    % index for configurations of different QY
    index = sqy_b(j+9995);
    loc = rc{9}(:,:,index);
    dip = dc{9}(:,:,index);

    num = length(loc);
    
    % number of energy realizations for static disorder
    n_avg = 1000;

    for mm=1:5
            for nn=1:n_avg
                inv_rate=inv(rateM( loc, dip, rand_ener(:,nn,mm)));
                avg_ex_time_9(j,mm,nn) = -num^-1*ones(1,num)*inv_rate*ones(num,1)
                quantum_yield_9(j,mm,nn) = -num^-1*k_cs*[1 1 zeros(1,num-2)]*inv_rate*ones(num,1);


            end
    end        
end

toc