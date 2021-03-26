function [beta] = update_beta(U, Z)
  
ker_num = size(U, 3);
beta = zeros(ker_num, 1);

nu = zeros(ker_num, 1);
x = 0;
for p=1:ker_num
  Mtmp = U(:,:,p) - U(:,:,p)*Z;
  nu(p) = trace(Mtmp*Mtmp');
  x = x + 1/nu(p);
end

for p=1:ker_num
  beta(p) = 1/(x*nu(p))^2;
end
  
end
