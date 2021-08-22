function r = reimannsum(f,a,b,n)
    sum = 0;
    dx = (b-a)/n;
    for k=1:n
        x = a + k*dx;
        sum = sum + f(x);
    end
    sum = dx.*sum;
    r = sum;
end