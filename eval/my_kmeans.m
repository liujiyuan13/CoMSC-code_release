function [indx] = my_kmeans(U, numclass)

U_normalized = U ./ repmat(sqrt(sum(U.^2, 2)), 1,numclass);
indx = kmeans(U_normalized,numclass, 'MaxIter',100, 'Replicates',50, 'EmptyAction','drop');
indx = indx(:);
  
end