# Multi-view Subspace Clustering via Co-training Robust Data Representation (CoMSC)

Matalb implementation for IEEE TNNLS paper:
- Jiyuan Liu, Xinwang Liu, Yuexiang Yang, Xifeng Guo, Marius Kloft and Liangzhong He:  
[Multi-view Subspace Clustering via Co-training Robust Data Representation](https://liujiyuan13.github.io/pubs/CoMSC_TNNLS.pdf), IEEE Transactions on Neural Networks and Learning Systems, TNNLS (Accepted Mar. 2021).

## Introduction
**Abstract**

Taking the assumption that data samples are able to be reconstructed with the dictionary formed by themselves, recent multi-view subspace clustering algorithms aim to find a consensus reconstruction matrix via exploring complementary information across multiple views. Most of them directly operate on the original data observations without pre-processing, while others on corresponding kernel matrices. However, they both ignore that the collected features may be designed arbitrarily and hard guaranteed to be independent and non-overlapping. As a result, original data observations and kernel matrices would contain a large number of redundant details. To address this issue, we propose a multi-view subspace clustering algorithm which groups samples and removes data redundancy concurrently. In specific, eigen-decomposition is employed to obtain the robust data representation of low-redundancy for later clustering. By utilizing the two processes into an unified model, clustering results will guide eigen-decomposition to generate more discriminative data representation, which, as a feedback, helps obtain better clustering results. Additionally, an alternate and convergent algorithm is designed to solve the optimization problem. Extensive experiments are conducted on eight benchmarks, and the proposed algorithm outperforms comparative ones in recent literature by a large margin, verifying its superiority. At the same time, its effectiveness, computational efficiency and robustness to noise are validated experimentally.


## Citation

If you find our code useful, please cite:

	@article{journals/tnnls/liucomsctnnls,
	  author    = {Jiyuan Liu and
	               Xinwang Liu and
	               Yuexiang Yang and
	               Xifeng Guo and
	               Marius Kloft and 
	               Liangzhong He},
	  title     = {Multi-view Subspace Clustering via Co-training Robust Data Representation},
	  journal   = {IEEE Transactions on Neural Networks and Learning Systems (TNNLS)},
	  volume    = {},
	  pages     = {},
	  year      = {2021},
	  url       = {},
	  doi       = {}
	}

## More
- For more related researches, please visit my homepage: [https://liujiyuan13.github.io](https://liujiyuan13.github.io).
- For data and discussion, please message me: liujiyuan13@nudt.edu.cn
