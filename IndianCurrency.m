%set path to train and validation directory 
train_dir='D:\Repositories\Projects\Image Classification\Notes Indian Final Dataset\Images\Train';
val_dir='D:\Repositories\Projects\Image Classification\Notes Indian Final Dataset\Images\Validation';

%train image data store
train_imds=imageDatastore(train_dir,'IncludeSubfolders',true,'FileExtensions','.jpg','LabelSource','foldernames');

%validation image data store
val_imds=imageDatastore(val_dir,'IncludeSubfolders',true,'FileExtensions','.jpg','LabelSource','foldernames');

%set image size to 224 rows , 224 columns
imageSize=[224 224 3];

%image augmentation applied on train dataset
train_augmenter = imageDataAugmenter(...
    'RandRotation',[-20,20],...
    'FillValue',0,...
    'RandXScale',[1,1],...
    'RandYScale',[1,1],...
    'RandXShear',[1,1],...
    'RandYShear',[1,1],...
    'RandXTranslation',[-3,3],...
    'RandYTranslation',[-3,3]);

%validation augmentation 
val_augmenter=imageDataAugmenter();

%applying augmentation on train and validation dataset
train = augmentedImageDatastore(imageSize,train_imds,'DataAugmentation',train_augmenter);
validation = augmentedImageDatastore(imageSize,val_imds,'DataAugmentation',val_augmenter);

%load vgg 19 model_architecture
net=vgg19;

%modify vgg_19 model architecture using Deep Network Designer
model=layers_1;

%set training parameters
opts = trainingOptions('sgdm', ...
    'MaxEpochs',30, ...
    'Shuffle','every-epoch', ...
    'Plots','training-progress', ...
    'Verbose',false, ...
    'InitialLearnRate',1e-3, ...
    'LearnRateSchedule','piecewise', ...
    'LearnRateDropPeriod',10, ...
    'LearnRateDropFactor',0.1,...
    'ValidationData',validation,...
    'MiniBatchSize',32,...
    'ExecutionEnvironment','gpu');

%train vgg19 model on custom dataset
[notenet,info] = trainNetwork(train, model, opts);

%make predictions on test dataset
cd 'D:\Repositories\Projects\Image Classification\Notes Indian Final Dataset'
img = imread("2000.jpg");
img_1 = imresize(img,[224,224]);
testpreds = classify(notenet,img_1);
testpreds;

%save model to local drive
cd 'C:\Users\nitin\Documents\MATLAB';
indian_notes_net = net;
save('notes_vgg_19','notenet');
