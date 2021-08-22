laplacelambda = @(x) laplace(x,2,2) ;
cauchylambda = @(x) cauchy(x,0,1);
gumbellambda = @(x) gumbel(x,1,2);
x1 = -20:0.5:20 ;
x2 = -40:0.5:40 ;
x3 = -20:0.5:20 ;
y1 = reimannsum (laplacelambda,-20,x1,100);
y2 = reimannsum(cauchylambda,-20,x2,100);
y3 = reimannsum(gumbellambda,-20,x3,100);
figure()
plot(x1,y1)
saveas(gcf,'laplacecdf.png')
figure()
plot(x2,y2)
saveas(gcf,'cauchycdf.png')
figure()
plot(x3,y3)
saveas(gcf,'gumbelcdf.png')
