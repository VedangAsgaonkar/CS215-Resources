n = 10^3; %the number of walkers
s = 10^-3; %the step size
t = 10^3; %the number of time steps
p = 0.5; %probability of moving to the right
x = 1:1:t;
spacetimeplot = zeros(n,t); %initializing the matrix used to store the data
for i = 1:n %for each walker
    for j = 1:t %for each timestep
        %binornd is used to get a random value of 0 or 1
        if(j==1)
            spacetimeplot(i,j) = (binornd(1,p)*2 - 1)*s ; 
        else
            spacetimeplot(i,j) = spacetimeplot(i,j-1) + (binornd(1,p)*2 - 1)*s ;
        end        
    end
end


k = 1:1:t;
figure()
hold on
for i=1:n
    plot(k,spacetimeplot(i,:),'color',rand(1,3)) %randomly chosing a color using a (1,3) rgb matrix
end
hold off

saveas(gcf,"spacetime.png")