poisson = @(x,l) exp(-l).*(l.^x)./factorial(x) ;

n = 10^5;
z = zeros(1,26);
for i=1:n
    newz = poissrnd(4);
    r = binornd(newz,0.8);
    z(r+1) = z(r+1)+1;
end
z = z/n;
disp(z)
k = 0:1:25;
zth = poisson(k,4*0.8);
disp(zth)
figure()
hold on
plot(k,z,'LineWidth',5);
plot(k,zth,'LineWidth',1);
legend({'empirical','theoretical'})
hold off
saveas(gcf,"thinning.png")