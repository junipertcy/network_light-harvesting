function [ randE ] = whatsDE_rand( randRc, stat_diso)
% whatsDE_rand: assign static disorder to the system
% this will generate output an energy column randE

    num = length(randRc(:,1));
    % Note we need to compare different deltaE and bias in the same realization
    randE = [zeros(1,num)]';
    
    for randE_i = num:-1:1
        randE(randE_i,:) = 0+normrnd(0,stat_diso);
    end
end 