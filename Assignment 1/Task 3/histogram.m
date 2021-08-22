r = randomwalk(10^4,10^-3,10^3,0.5);
hist(r,30);
saveas(gcf,"histogram.png")