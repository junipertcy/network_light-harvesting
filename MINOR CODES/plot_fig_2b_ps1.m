% plot_fig_2b_ps1: code for plot Fig.2-b
% BACKGROUND VAR: quantum_yield_ps1_rand or avg_ex_time_ps1_rand

[aa bb]=sort(quantum_yield{9},'ascend')
for i=1:5
mean_case(i,:)=mean(squeeze(quantum_yield_ps1_rand(i,:,:))');
std_case(i,:)=std(squeeze(quantum_yield_ps1_rand(i,:,:))');
end

mean_case=[0.9728; mean_case];
std_case=[0; std_case];

errorbar(mean_case',std_case','o-');