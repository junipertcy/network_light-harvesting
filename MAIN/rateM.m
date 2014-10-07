function [ rate ] = rateM( randRc, randDc, randE)
% RateM generates the Foerster rate matrix of size num*num, unit: s^-1

num = length(randE);
rateMF = zeros(num,num);

for i = 1:num
    for j = 1:num
        if i == j
            rateMF(i,i) = 0;
        else
        [rateMF(i,j) rateMF(j,i)] = FRate( randRc(i,:), randRc(j,:), randDc(i,:), randDc(j,:), randE(i,:), randE(j,:));
        end
    end
end

% no back transfer from the RC to other sites
% rateMF(:,1) = 0;
% rateMF(:,2) = 0;

rate = rateMF;

diss = diag([-ones(1,num)*1e9]);

% for sener's JPCB 2002, 106, 7948 paper
diss(1,1)=-1e12-1e9;
diss(2,2)=-1e12-1e9;
% diss(1,1)=0;
% diss(2,2)=0;

% excited state decay rate for all sites except the RC
rate = rate+diag(-sum(rate(:,:)))+diss;


end

