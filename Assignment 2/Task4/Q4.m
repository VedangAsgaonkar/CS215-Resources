N = 60000 ;
A = importdata('mnist.mat');
mu = zeros(28*28,10, 'double');
freq = zeros(1,10,'double');
cov = zeros(28*28,28*28,10,'double');
for i = 1:10
    label_i = find(A.labels_train == i-1);
    shape = sum(double(A.digits_train(1:28,1:28,label_i)),3);
    shape = reshape(shape, 784,1);
    freq(1,i) = size(A.digits_train(1:28,1:28,label_i),3);
    mu(1:28*28,i) = shape/freq(i);
    sh = reshape(mu(1:28*28,i), 28,28);
    shape = double(A.digits_train(1:28,1:28,label_i));
    shape = reshape(shape, 28*28,freq(i));
    cov(1:28*28,1:28*28,i)= shape*transpose(shape)/freq(i) - mu(1:28*28,i)*transpose(mu(1:28*28,i));
    h = imagesc(sh);
    saveas(h,sprintf('Mean_of_%d_images.png',i-1));
end

v1 = zeros(28*28,10,'double');
eig1 = zeros(10,'double');
for i = 1:10
    [V,D] = eig(cov(1:28*28,1:28*28,i));
    [d,ind] = sort(diag(D),'descend');
    Ds = D(ind,ind);
    Vs = V(:,ind);
    v1(1:28*28,i)=Vs(1:28*28,1);
    eig1(i) = Ds(1,1); 
    h =scatter(1:784,diag(Ds),'filled');
    saveas(h,sprintf('Eigenvalues_of_%d_.png',i-1)); %plotting each histogram and saving it
end

for i = 1:10
    shape = reshape(mu(1:28*28,i)-sqrt(eig1(i))*v1(1:28*28,i) , 28,28);
    h = imagesc(shape);
    saveas(h,sprintf('Mu_minus_sqrt(lambda)v_for_%d.png',i-1)); %plotting each histogram and saving it
    shape = reshape(mu(1:28*28,i),28,28);
    h = imagesc(shape);
    saveas(h,sprintf('Mu_for_%d.png',i-1)); %plotting each histogram and saving it
    shape = reshape(mu(1:28*28,i)+sqrt(eig1(i))*v1(1:28*28,i) , 28,28);
    h = imagesc(shape);
    saveas(h,sprintf('Mu_plus_sqrt(lambda)v_for_%d.png',i-1)); %plotting each histogram and saving it
end