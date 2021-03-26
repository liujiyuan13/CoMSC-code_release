function [indx] = my_lite_kmeans(U, numclass)

U_normalized = U ./ repmat(sqrt(sum(U.^2, 2)), 1,numclass);
indx = lite_kmeans(U_normalized,numclass, 'MaxIter',100, 'Replicates',50);
indx = indx(:);
  
end