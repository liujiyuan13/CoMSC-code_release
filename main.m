clear
clc
warning off

proj_path = 'D:\Work\CoMSC-code_release\';
addpath(genpath(proj_path));

data_path = 'D:\Work\datasets\mData\Fmatrix\';
data_name = 'Dermatology';

load([data_path, data_name, '_fea'], 'X', 'Y', 'view_meaning', 'class_meaning');
k = length(unique(Y));
view_num = size(X, 1);
smp_num = size(X{1}, 2);

% compute kernels
X = normalize_data(X);
ker_num = view_num*5;
K = zeros(smp_num, smp_num, ker_num);
for v=1:view_num
    options.KernelType = 'Gaussian';
    K(:,:,1+(v-1)*5) = construct_kernel(X{v}', [], options);
    options.KernelType = 'Polynomial';
    options.d = 3;
    K(:,:,2+(v-1)*5) = construct_kernel(X{v}', [], options);
    options.KernelType = 'Linear';
    K(:,:,3+(v-1)*5) = construct_kernel(X{v}', [], options);
    options.KernelType = 'Sigmoid';
    options.c = 0;
    options.d = 0.1;
    K(:,:,4+(v-1)*5) = construct_kernel(X{v}', [], options);
    options.KernelType = 'InvPloyPlus';
    options.c = 0.01;
    options.d = 1;
    K(:,:,5+(v-1)*5) = construct_kernel(X{v}', [], options);
end

% center and normalized kernels
K = kcenter(K);
K = knorm(K);

% parameters
cset = [1:1:20]*k;
len_cset = length(cset);
lambda_1_set = 2.^[-10:2:10];
len_lbd1 = length(lambda_1_set);
lambda_2 = 2^0; % always set to 1, for it is not discussed in the paper
max_iter = 20;

metrics_meaning = {'acc'; 'nmi'; 'purity'; 'AR'; 'RI'; 'MI'; 'HI'; 'fscore'; 'precision'; 'recall'};

for ic=1:length(cset)
    if cset(ic)>=smp_num
      break;
    end
    for il=1:len_lbd1
      % main algorithm
      [Z, ~, ~, ~, ~ ] = CoMSC(K, cset(ic), lambda_1_set(il), lambda_2, max_iter);
      PI = Z > 0;
      Z = Z.*PI;
      [U] = baseline_spectral_onkernel( abs( (Z + Z') / 2) , k);
      [y] = my_kmeans(U, k);
      [eval] = my_eval_y(y, Y);
      fprintf('\nic: %d, il: %d, acc: %f, nmi: %f, pur: %f', ic, il, eval(1), eval(2), eval(3)); 
    end
end

