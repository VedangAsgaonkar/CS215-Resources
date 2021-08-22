%INPUT n: number of walkers, s: step size, t: timestep, p: probability of
%moving right
%OUTPUT r: vector of shape (1,n) storing final positions of the n walkers
function r = randomwalk(n,s,t,p)
    r = zeros(1,n);
    for i = 1:n %for each walker
       x = 0;
       for j = 1:t %for each timestep
           coin = binornd(1,p); 
           if(coin==1)
               x = x + s;
           else
               x = x - s;
           end
       end
       r(i) = x ;
    end
end