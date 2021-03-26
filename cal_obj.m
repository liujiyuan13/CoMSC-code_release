function [obj, term1, term2, term3] = cal_obj(K, U, Z, beta, gamma, lambda_1, lambda_2)

ker_num = size(K, 3);

term1 = trace(Z*Z');

term2 = 0;
for p=1:ker_num
  Mp = U(:,:,p) - U(:,:,p)*Z;
  term2 = term2 + beta(p)*trace(Mp*Mp');
end

term3 = 0;
for p=1:ker_num
  term3 = term3 + gamma(p)*trace(U(:,:,p)*K(:,:,p)*U(:,:,p)');
end

obj = lambda_1*term1 + term2 - lambda_2*term3;

end
