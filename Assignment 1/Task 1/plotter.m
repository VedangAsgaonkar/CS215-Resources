x1 = -20:0.5:20 ;
y1 = laplace(x1,2,2) ;
plot(x1,y1);
saveas(gcf,'laplacepdf.png')
figure()
x2 = -20:0.5:20 ;
y2= cauchy(x2,0,1) ;
plot(x2,y2) ;
saveas(gcf,'cauchypdf.png')
figure()
x3 = -20:0.5:20 ;
y3= gumbel(x3,1,2) ;
plot(x3,y3) ;
saveas(gcf,'gumbelpdf.png')