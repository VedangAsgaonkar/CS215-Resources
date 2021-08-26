N = [5, 10, 20, 40, 60, 80, 100, 500, 10^3, 10^4];
for i = 1:10
    arr = randn(100, N(i));
    avg = mean(arr,2);
    if i==1
        error = abs(avg);
    else 
        error = [error , abs(avg)];
    end
end
g = {};
for i = 1:10
    g = [g , sprintf('N= %d', N(i))];
end
boxplot(error , 'labels' , g);
saveas(gca , 'Boxplot_Gaussian_distribution.png');