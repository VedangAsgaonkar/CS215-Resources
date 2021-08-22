laplacelambda = @(x) laplace(x,2,2) ;
laplaceone = @(x) x.*laplace(x,2,2) ;
laplacetwo = @(x) x.*x.*laplace(x,2,2) ;
gumbellambda = @(x) gumbel(x,1,2);
gumbelone = @(x) x.*gumbel(x,1,2) ;
gumbeltwo = @(x) x.*x.*gumbel(x,1,2) ;
%laplace variance = 8
%gumbell variance = 6.5797

x= -40:0.01:40;
laplacesum = sum(laplacelambda(x));
laplaceavg = sum(laplaceone(x))/laplacesum ;
laplaceavgsquare = sum(laplacetwo(x))/laplacesum ;
laplacevar = laplaceavgsquare - laplaceavg*laplaceavg ;
disp(laplacevar)

gumbelsum = sum(gumbellambda(x));
gumbelavg = sum(gumbelone(x))/gumbelsum ;
gumbelavgsquare = sum(gumbeltwo(x))/gumbelsum ;
gumbelvar = gumbelavgsquare - gumbelavg*gumbelavg ;
disp(gumbelvar)