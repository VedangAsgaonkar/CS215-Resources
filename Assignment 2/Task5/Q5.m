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
end

rng(10)
for i = 1:10
    [V,D] = eig(cov(1:28*28,1:28*28,i));
    [d,ind] = sort(diag(D),'descend');
    Ds = D(ind,ind);
    Vs = V(:,ind);
    v84 = Vs(1:28*28 ,1:84);
    label_i = find(A.labels_train == i-1);   
    shape = double(A.digits_train(1:28,1:28,(label_i(randi(size(label_i,[1]))))));
    row_shape = reshape(shape , 1,28*28)-reshape(mu(1:28*28,i),1,28*28);
    new_rep = row_shape*v84;
    new_image = new_rep* transpose(v84) + reshape(mu(1:28*28,i),1,28*28);
    new_image = reshape(new_image , 28,28);
    h = imagesc(shape);
    saveas(h,sprintf('Original_sample_of_%d.png',i-1)); %plotting each histogram and saving it
    h =imagesc(new_image);
    saveas(h,sprintf('Same_image_in_84_coordinates_for_%d.png',i-1)); %plotting each histogram and saving it


end