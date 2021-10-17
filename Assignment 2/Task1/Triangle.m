 function[X,Y] = Triangle(N)
 X = zeros(N,1,'double');
 Y = zeros(N,1,'double');
   for i = 1:N
    x = pi*rand();
    y = exp(1)*rand();
    if exp(1)*x<=y*pi/3
        x = pi/3-x;
        y = exp(1)-y;
    end
    if y+(x*3*exp(1)/(2*pi))>=(3*exp(1)/2)
        x = 4*pi/3-x;
        y = exp(1)-y;
    end
    X(i)=x;
    Y(i)=y;
   end