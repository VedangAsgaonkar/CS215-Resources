function l = laplace(x,u,b)
    l = exp(-abs(x-u)/b)/(2*b);
end

