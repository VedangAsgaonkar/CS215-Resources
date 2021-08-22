n = 10^4;
r = randomwalk(n,10^-3,10^3,0.5);
sumone = sum(r);
sumtwo = sum(r.*r);
mean = sumone/n;
variance = sumtwo/n - sumone^2;
disp(mean)
disp(variance)

%mean = -8.2000e-06
%variance = -0.0057