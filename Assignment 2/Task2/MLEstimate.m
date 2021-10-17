rng('default')
C = [1.6250,-1.9486;-1.9486,3.8750];
mu = [1;2];

for n = 1:5
    N = 10^n;
    r = gaussianSample(C,mu,N);
    x = r(1,:);
    y = r(2,:);
    c = zeros(2);
    mux = sum(x)/N;
    muy = sum(y)/N;  
    for j = 1:N
        c = c + [x(j)-mux ; y(j)-muy]*[x(j)-mux, y(j)-muy];
    end
    c = c/N;
    mux
    muy
    c
end