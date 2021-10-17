C = [1.6250,-1.9486;-1.9486,3.8750];
mu = [1;2];
for n = 1:5
    N = 10^n;
    r = gaussianSample(C,mu,N);
    x = r(1,:);
    y = r(2,:);
    c = zeros(2);
    mux = sum(x)/N;
    muy = sum(y)/N;
    for i = 1:N
        c = c + [x(i)-mux ; y(i)-muy]*[x(i)-mux, y(i)-muy];
    end
    c = c/N;
    [V,D] = eig(c);
    l = diag(D);
    [l, idx] = sort(l,'descend');
    V = V(:,idx);
    
    figure(n);
    hold on
    scatter(x,y); 
    norm1 = norm(V(1));
    norm2 = norm(V(2));
    plot([mux-l(1)*V(1,1)/norm1,mux+l(1)*V(1,1)/norm1],[muy-l(1)*V(2,1)/norm1,muy+l(1)*V(2,1)/norm1],'-r');
    plot([mux-l(2)*V(1,2)/norm2,mux+l(2)*V(1,2)/norm2],[muy-l(2)*V(2,2)/norm2,muy+l(2)*V(2,2)/norm2],'-g');
    hold off
    saveas(gcf,sprintf('plot%d.png',n))
end