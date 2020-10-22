# Indian-Notes-Classification MATLAB

### Indian Notes Classification Using VGG-19 model 

![alt text](https://github.com/nogifeet/Indian-Notes-Classification/blob/main/image.jpg "Image")

### Problem Statement
Blind people can have a really hard time recognizing paper currency while they can easily recognize coins due to their different texture, shape and thickness. In this repository, I try to solve the problem using Image Classification. There are ten different classes denoting all the paper currency denominations.

### Data Preparation
There are not a lot of images of Indian currency on the internet without watermarks. So I decided to create my dataset using different angles, zoom, noise, lighting condition. There are 55 images for each class for training(55 X 10 = 550 images) and 20 images for validation (20 X 10 = 200 images) **New 20 rupees paper denomination is not included as it wasn't available with me**

### Image Folder Structure
![alt text](https://github.com/nogifeet/Indian-Notes-Classification/blob/main/folder_str.PNG "Folder Structure")

##### VGG-19 Model Architecture
![alt text](https://github.com/nogifeet/Cat-Vs-Dog-Classification/blob/main/vgg19.png "VGG-19")

### MATLAB Tools and Apps
1. MATLAB r2020b
2. Deep Network Designer App
3. Image Processing Toolbox

