
# Project Summary
## Self-Organizing Map                                                        
### Group Project: [Academic, 2018], Subject: Data Mining
 (missing data imputation and Algorithm Acuteness Processing)
### Objective: Find the missing data imputation of Datasets (Unsupervised Learning) and tune the parameter of algorithm to achieve NRMS 0.1 and AE < 1.
 
### Supportive Environment:

Programming language: MATLAB 2018a (Math work)
Software Toolkit: Orange (data mining, machine learning)
 
### Explanation: 
	There are 24 real modified datasets given by the professor. And in the group, our goal is to 
	identify the missing data pattern of 19 types of different dataset with [1%,5%,10% ,20%] using data mining and find the possible answer with the help of the Unsupervised algorithm.
	We choose SOM (self organize map) to find the answer with clustering, gradient descent and identify the no of iteration for best accuracy of the model by comparing with true data set.
	Use gaussian function and train the model using parameters of neighborhood function with measurement of BMU (neuron u) and neuron v.
. 
### Parameters:
[1] Initial Width (w)
[2] learning rate (∝), for better time profile and fast optimization 

### Used Notations:
These are the variables needed, with vectors in ‘bold’
	 S   is the current iteration
	ƛ is the iteration limit
	t is the index of the target input data vector in the input data set  
	D(t)  is a target input data vector
	 v is the index of the node in the map
	 Wu is the current weight vector of node  
	 u is the index of the best matching unit (BMU) in the map
	 θ is a restraint due to distance from BMU, usually called the neighbourhood function, and
	  ∝(s) is a learning restraint due to iteration progress.

### Algorithm:

	Randomize the node weight vectors in a map
	Randomly pick an input vector D(t)
	Traverse each node in the map
	Use the Euclidean Distance formula to find the similarity between the input vector and the map's node's weight vector
	Track the node that produces the smallest distance (this node is the best matching unit, BMU)
	Update the weight vectors of the nodes in the neighborhood of the BMU (including the BMU itself) by pulling them closer to the input vector
	  
	Increase  s and repeat from step 2 while s< ƛ



### Work challenges: 
1] Space complexity: For dealing with the big datasets as well as iterative process produce shortage of the local environment space.
2] Data cleaning, Pattern recognition is complex task
3] Computational complexity: T = O(N*C) = O(S2), with increase of the vector and matrix size the complexity increase due to depend on no. of rows and columns. In term of row and columns its 0(m*n)

### Achievements:
	Use NRMS and AE method for identify the error and accuracy percentage. Our goal is to keep NRMS near to 1 and AE must be more than 1. We achieve accuracy between 75 to 90 percent. However, we can not manage some dataset due to inefficient time and space availability problem. 
	But, successfully Identify the measurement weakness of SOM, that with increase of missing rate the accuracy decreases significantly. 
