[x,y] = Ellipse(1,2,10^7);
h = histogram2(x,y , 'DisplayStyle','tile');
saveas(h,sprintf('Ellipse_dist.png')); %plotting each histogram and saving it
