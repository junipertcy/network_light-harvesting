% plot_fig_2b: code for plot Fig.2-b
% BACKGROUND VAR: quantum_yield_9 or avg_ex_time_9

[aa bb]=sort(quantum_yield{9},'ascend')
for i=1:5
mean_case(i,:)=mean(squeeze(quantum_yield_9(i,:,:))');
std_case(i,:)=std(squeeze(quantum_yield_9(i,:,:))');
end

for i=1:5
mean_temp(i)=quantum_yield{9}(bb(i));
std_temp(i)=0;
end

mean_case=[mean_temp' mean_case];
std_case=[std_temp' std_case];


errorbar(mean_case',std_case','d-');