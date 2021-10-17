C = [1.6250,-1.9486;-1.9486,3.8750];
mu = [1;2];
e = zeros(100,5);
for n = 1:5
    N = 10^n;
    for i = 1:100
        m = sum(gaussianSample(C,mu,N),2)/N;        
        e(i,n) = norm(m-mu)/norm(mu);
    end
end

figure()
boxchart(e);
saveas(gcf,'mean.png')