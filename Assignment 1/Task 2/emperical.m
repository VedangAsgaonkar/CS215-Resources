z = zeros(1,26);
n = 10^6;
for i = 1:n
    newz = poissrnd(3)+poissrnd(4);
    if(newz<=25)
        z(newz+1) = z(newz+1) + 1;
    end    
end



poisson = @(x,l) exp(-l).*(l.^x)./factorial(x) ;

z = z/n ;
disp(z)
k = 0:1:25;
zth = poisson(k,7);
disp(zth)
figure()
hold on
plot(k,z,'LineWidth',5);
plot(k,zth,'LineWidth',1);
legend({'empirical','theoretical'})
hold off
saveas(gcf,"empericalvstheoretical.png")

