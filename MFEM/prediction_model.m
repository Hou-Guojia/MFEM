
%% Underwater Image Quality Prediction

%% Using the prediction Model trained on UWIQA dataset
load UWIQAmodel;
%input image
I = imread('0001.png');
%Feature extraction
Features= getFeatures(I);
%Quality Score prediction
Pred= predict(Mdl,Features);

%% Using the prediction Model trained on UIED dataset
load UIEDmodel;
%input image
I = imread('0001.png');
%Feature extraction
Features= getFeatures(I);
%Quality Score prediction
Pred= predict(Mdl,Features);