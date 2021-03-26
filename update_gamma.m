function [gamma] = update_gamma(K, U)
  
ker_num = size(U, 3);
gamma = zeros(ker_num, 1);

nu = zeros(ker_num, 1);
x = 0;
for p=1:ker_num
  Mtmp =  U(:,:,p)*K(:,:,p)*U(:,:,p)';
  nu(p) = trace(Mtmp);
  x = x + nu(p)^2;
end

for p=1:ker_num
  gamma(p) = nu(p)/sqrt(x);
end
  
  
end
