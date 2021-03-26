function [ProcessData]=normalize_data(X)

nView = length(X);
nSmp = size(X{1},2);

ProcessData = cell(nView, 1);
for v = 1:nView
	Xv = X{v}+1e-12;
	for i = 1:nSmp
	    % ProcessData{v}(:,i) = Xv(:,i) ./ max(1e-12,norm(Xv(:,i)));
	    ProcessData{v}(:,i) = Xv(:,i) ./ sqrt(Xv(:,i)'*Xv(:,i));
	end
end