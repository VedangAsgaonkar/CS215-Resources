A = importdata('points2D_Set2.mat');
x = A.x;
y = A.y;
c = zeros(2);
mux = sum(x)/1000;
muy = sum(y)/1000;
for i = 1:1000
    c = c + [x(i)-mux ; y(i)-muy]*[x(i)-mux, y(i)-muy];
end
c = c/1000;
[V,D] = eig(c);
l = diag(D);

[l, idx] = sort(l,'descend');

l
%1.1037
%0.0976


V = V(:,idx);
V

figure()
hold on
scatter(x,y)
plot([mux-V(1),mux+V(1)],[muy-V(2),muy+V(2)],'-r')
hold off
saveas(gcf,'plot2.png')