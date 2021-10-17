rng('default')
s1 = zeros([19200,1]);
s2 = zeros(19200);
for i = 1:16
    s1 = s1 + single(reshape(imread(sprintf('image_%d.png',i)),[19200,1]));
    s2 = s2 + single(reshape(imread(sprintf('image_%d.png',i)),[19200,1]))*single(reshape(imread(sprintf('image_%d.png',i)),[19200,1])).';
end
mu = s1/16;
c = (s2/16) - ((s1*s1.')/256);
clear s1
clear s2

[V,D] = eigs(double(c),10);

l = diag(D);
clear D
[l,idx] = sort(l,'descend');
V = V(:,idx);

mu = reshape(mu,[80,80,3]);
mu = rescale(mu);
figure()
subplot(3,2,1);
image(mu);

for i = 1:4
    img = reshape(V(:,i),[80,80,3]);
    img = rescale(img);
    subplot(3,2,i+1);
    image(img);
end
saveas(gcf,'mean.png')

figure()
plot(l);
saveas(gcf,'eigenvalues.png')




mu = reshape(mu,[19200,1]);
for i = 1:16
    img = single(reshape(imread(sprintf('image_%d.png',i)),[19200,1]));
    rep = mu + dot(img-mu,V(:,1))*V(:,1) + dot(img-mu,V(:,2))*V(:,2) + dot(img-mu,V(:,3))*V(:,3) + dot(img-mu,V(:,4))*V(:,4);
    rep = reshape(rep,[80,80,3]);
    rep = rescale(rep);
    img = reshape(img,[80,80,3]);
    img = rescale(img);
    figure()
    subplot(1,2,1)
    image(img);
    subplot(1,2,2)
    image(rep);
    saveas(gcf,sprintf('closest_%d.png',i))
end


for i = 1:3
    W = randn([4,1]);
    A = sqrtm(diag(l(1:4)));
    Y = A*W;
    img = mu + Y(1)*V(:,1) + Y(2)*V(:,2) + Y(3)*V(:,3) + Y(4)*V(:,4) ;
    img = reshape(img,[80,80,3]);
    img = rescale(img);
    figure()
    image(img);  
    saveas(gcf,sprintf('sample_%d.png',i))
end



