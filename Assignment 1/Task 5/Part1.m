N = [5, 10, 20, 40, 60, 80, 100, 500, 10^3, 10^4];
errors = {};
for i = 1:10
    arr = rand(100, N(i));
    avg = mean(arr,2);
    if i==1
        errors = abs(avg-0.5);
    else 
        errors = [errors , abs(avg-0.5)];
    end
end
g = {};
for i = 1:10
    g = [g , sprintf('N= %d', N(i))];
end
boxplot(errors , 'labels' , g);
saveas(gca , 'Boxplot_uniform_distribution.png');
