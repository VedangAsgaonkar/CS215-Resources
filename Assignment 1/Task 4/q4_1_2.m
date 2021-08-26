M = 100000;
x = M_distribution(M);
h = histogram(x , 200);
h.BinLimits = [-1,1];
saveas(h , 'Histogram.png')
cdfplot(x);
