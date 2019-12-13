<!-- wp:image {"id":416,"width":658,"height":177,"sizeSlug":"large","className":"is-style-default"} -->
<figure class="wp-block-image size-large is-resized is-style-default"><img src="https://vedantdave117com.files.wordpress.com/2019/12/500px-somtraining.svg_.png?w=500" alt="" class="wp-image-416" width="658" height="177"/><figcaption>Self - Organizing Map (Unsupervised Algorithm)</figcaption></figure>
<!-- /wp:image -->

<!-- wp:heading -->
<h2><strong>Project Intuition:</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph {"align":"justify","fontSize":"medium"} -->
<p class="has-text-align-justify has-medium-font-size">This Project is to identify the missing data pattern on different percentage of missing values (1%, 2%, 5%, 10%). The project intuition is from the survey analysis research paper which use the same method of data imputation for the survey accomplishment.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2>Objective:</h2>
<!-- /wp:heading -->

<!-- wp:paragraph {"align":"justify","fontSize":"medium"} -->
<p class="has-text-align-justify has-medium-font-size">Identify missing data pattern, Use Unsupervised algorithm (Self Organizing Map) for fill missing datasets. Tuning algorithmic parameters and get the best accuracy score for the given sets. The evaluation parameters are different according to data sets. There are 16 Numerical, 4 categorical and 4 Mixed data sets in which AE is used for Categorical whereas for numerical data set I use NRMS.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"align":"justify","fontSize":"medium"} -->
<p class="has-text-align-justify has-medium-font-size">The limit for the good quality of data prefers NRMS &lt; 0.1 and AE &lt; 1.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2><strong>Supportive Environment:</strong></h2>
<!-- /wp:heading -->

<!-- wp:paragraph {"align":"justify","fontSize":"medium"} -->
<p class="has-text-align-justify has-medium-font-size">Programming language: MATLAB 2018a (Math work) Software Toolkit: Orange (data mining, machine learning)</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2>Implementation Concept:</h2>
<!-- /wp:heading -->

<!-- wp:paragraph {"align":"justify","fontSize":"medium"} -->
<p class="has-text-align-justify has-medium-font-size">There are 24 real modified datasets given by the professor. And in the group, our goal is to  identify the missing data pattern of 19 types of different dataset with [1%,5%,10% ,20%] using data mining and find the possible answer with the help of the Unsupervised algorithm. </p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"fontSize":"medium"} -->
<p class="has-medium-font-size">We choose SOM (self organize map) to find the answer with clustering, gradient descent and identify the no of iteration for best accuracy of the model by comparing with true data set.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"align":"justify","fontSize":"medium"} -->
<p class="has-text-align-justify has-medium-font-size">Use gaussian function and train the model using parameters of neighborhood function with measurement of BMU (neuron u) and neuron v.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2>Parameters:</h2>
<!-- /wp:heading -->

<!-- wp:paragraph {"fontSize":"medium"} -->
<p class="has-medium-font-size">[1] Initial Width (w) [2] learning rate (∝), for better time profile and fast optimization</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2>Used Notations:</h2>
<!-- /wp:heading -->

<!-- wp:paragraph {"align":"justify","fontSize":"medium"} -->
<p class="has-text-align-justify has-medium-font-size">These are the variables needed, with vectors in ‘bold’ S is the current iteration ƛ is the iteration limit t is the index of the target input data vector in the input data set D(t) is a target input data vector v is the index of the node in the map Wu is the current weight vector of node u is the index of the best matching unit (BMU) in the map θ is a restraint due to distance from BMU, usually called the neighbourhood function, and ∝(s) is a learning restraint due to iteration progress.</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2>Algorithm:</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul><li>Rendomize the node weight vector in map</li><li>Randomly pick an input vector D(t)</li><li>Traverse each node in the map</li><li>Use Euclidena Distance Formula to find the similarity between imput vector and map's node weight vector.</li><li>Track node position which procude the smallest distance able to show best matching unit.</li><li>Update weight vectors of nodes in the neighbourhood of BMU (include itself) by pulling them closer to input vector.</li><li>Increase S and repeat the process form step 2 when s&lt; ƛ (lambda)</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2>Work challenges:</h2>
<!-- /wp:heading -->

<!-- wp:paragraph {"align":"justify","fontSize":"medium"} -->
<p class="has-text-align-justify has-medium-font-size">1] Space complexity: For dealing with the big datasets as well as iterative process produce shortage of the local environment space.</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"align":"justify","fontSize":"medium"} -->
<p class="has-text-align-justify has-medium-font-size">&nbsp;2] Data cleaning, Pattern recognition was complex task</p>
<!-- /wp:paragraph -->

<!-- wp:paragraph {"align":"justify","fontSize":"medium"} -->
<p class="has-text-align-justify has-medium-font-size">3] Computational complexity: T = O(N<em>C) = O(S2), with increase of the vector and matrix size the complexity increase due to depend on no. of rows and columns. In term of row and columns its 0(m*</em>n)</p>
<!-- /wp:paragraph -->

<!-- wp:heading -->
<h2>Achievements:</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul><li>Get the value of NRMS near to 0.1 and AE  below 1, and overall accuracy is between 75 to 90 percent.</li><li>Sucessfully Identify SOM effectiveness decrementation with increase of error.</li></ul>
<!-- /wp:list -->

<!-- wp:heading -->
<h2>Attachment</h2>
<!-- /wp:heading -->

<!-- wp:list -->
<ul><li>Project Report</li><li>Project Presentation demo</li><li>Evaluation table </li><li>Codes</li></ul>
<!-- /wp:list -->

<!-- wp:paragraph -->
<p></p>
<!-- /wp:paragraph -->


