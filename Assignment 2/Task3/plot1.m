A = importdata('points2D_Set1.mat');
x = A.x;
y = A.y;
c = zeros(2);
mux = sum(x)/300;
muy = sum(y)/300;
for i = 1:300
    c = c + [x(i)-mux ; y(i)-muy]*[x(i)-mux, y(i)-muy];
end
c = c/300;
[V,D] = eig(c);
l = diag(D);
[l, idx] = sort(l,'descend');

% 0.2925
% 0.0025


V = V(:,idx);

V
l
figure()
hold on
scatter(x,y)
plot([mux-V(1),mux+V(1)],[muy-V(2),muy+V(2)],'-r')
hold off
saveas(gcf,'plot1.png')