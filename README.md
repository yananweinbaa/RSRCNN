## RSRCNN\
Work in ''Road Structure Refined CNN for Road Extraction in Aerial Image''

...........unfinished and updating............<br>
if any question, send your e-mial to yananwei@buaa.edu.cn

Requirements:
--------------------------------------------
####Linux 14.04
####opencv 2.4.10
####python 2.7.6
####gcc 4.8.4
####g++ 4.8.4
####cmake 2.8.10
####caffe-future


Dataset:
---------------------------------------------
You can found the dataset(Massachusetts Roads Dataset) [here](https://www.cs.toronto.edu/%7Evmnih/data/.).  Note that we followed MnihThesis to divide those 1,171 aerial
images into training (1,108 images), validation (14 images) and test sets (49 images).
(After observing the dateset, you may find that there exist some images which has partial mismatched groundtruth. 
It is because the Massachusetts Roads Dataset is used to study the effectiveness of the robust in [MnihThesis's work](https://www.cs.toronto.edu/%7Evmnih/docs/Mnih_Volodymyr_PhD_Thesis.pdf).
Therefore, you have to discard some samples.)

Experiment:
---------------------------------------------
###Install Caffe-future

You should use the Caffe-future source files provided, since the cross-entropy loss layer has been changed to obtain a road-structure-based loss. You can refer to the [setup guide](http://caffe.berkeleyvision.org/install_apt.html) to install caffe(using cuda can speed up training). 

###Create Dataset

* Segmente each image, in training, validation and test sets, into 16 non-overlapping 375× 375 images. <br>
* Shuffle the training set and develop the .txt files containing all the names and labels of images in the  training set (FindList.sh is referable to do this work).<br>
* Using the .txt files to develop the lmdb files. MakeLmdb.sh can finish this work.<br>
* Develop the mean.binaryproto files. MakeMean.sh can work well.<br>
