function [U] = update_U(K, Z, beta, gamma, c, lambda_2)
  
ker_num = size(K, 3);
smp_num = size(K, 1);

U = zeros(c, smp_num, ker_num);
for p=1:ker_num
  Mtmp = 2*beta(p)*Z' - beta(p)*Z*Z' + lambda_2*gamma(p)*K(:,:,p);
  Utmp = my_kernel_kmeans(Mtmp, c);
  U(:,:,p) = Utmp';
end
  
end
