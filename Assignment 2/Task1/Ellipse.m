function [x,y] = Ellipse(a,b,N)
   r = sqrt(rand(N,1));
   theta = 2*pi*rand(N,1);
   x = a*r.*cos(theta);
   y = b*r.*sin(theta);