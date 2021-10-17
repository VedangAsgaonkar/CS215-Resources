[x,y] = Triangle(10^7);
h = histogram2(x,y,'DisplayStyle','tile');
saveas(h,sprintf('Triangle_dist.png')); %plotting each histogram and saving it
