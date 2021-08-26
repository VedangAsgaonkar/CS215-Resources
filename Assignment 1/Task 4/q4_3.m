N = [2,4,8,16,32,64];
for i = N
    y = Avg_M_distribution(10000, i);
    h = histogram(y , 200 , "BinLimits",[-1,1]);
    saveas(h,sprintf('Histogram_of_Y_for_N_=_%d_.png',i));
end
for i = [1,N]
    y = Avg_M_distribution(10000, i);
    cdfplot(y);
    hold on;
end
N = [1,N];
Legend = cell(7 , 1);
for i = 1:7
    Legend{i}= sprintf('CDF of Y for N = %d', N(i));
end
legend(Legend ,'Location' ,'northwest');
hold off
saveas(gca , 'CDF_distributions.png');


