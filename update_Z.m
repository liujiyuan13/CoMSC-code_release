function [Z] = update_Z(U, beta, lambda_1)
  
ker_num = size(U, 3);
smp_num = size(U, 2);

D = zeros(smp_num, smp_num);
D = D + lambda_1*diag(ones(smp_num,1));
for p=1:ker_num
  D = D + beta(p)*U(:,:,p)'*U(:,:,p);
end
D = inv(D);

Z = -D./diag(D)';
Z = Z - diag(diag(Z));
  
end
