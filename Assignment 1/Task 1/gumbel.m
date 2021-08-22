function g = gumbel(x,u,b)
    g = (1/b)*( exp( -( ( (x-u)/b ) + exp(-(x-u)/b ) ) ) ) ;
end