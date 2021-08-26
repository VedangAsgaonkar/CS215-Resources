function X= M_distribution( M )
    cdf = rand(1 , M);
    X = sign(cdf - 0.5).*sqrt(abs(1-2*cdf));
end
