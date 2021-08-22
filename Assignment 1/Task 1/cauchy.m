function c = cauchy(x, x0 ,g)
    c = (g*g ./ (g*g + (x-x0).*(x-x0) ) ) / (g*pi) ;
end