function H_normalized = my_kernel_kmeans( K,cluster_count )

opt.disp = 0;
K= (K+K')/2;
[H,~] = eigs(K,cluster_count,'LA',opt);
H_normalized = H;

end

