function r = gaussianSample(C,mu,N)
    [V,D] = eig(C);
    A = V*sqrtm(D);
    r = A*randn([2 N]) + mu;
end