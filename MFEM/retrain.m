%% Path to the underwater IQA dataset directory
 path = '.\path\';

% Image Number
numberOfImages = 890;
Scores = zeros(numberOfImages, 890);

Features = zeros(numberOfImages,35);

%Feature Extraction
for i=1:numberOfImages
    disp(i);
    img  = imread( char(strcat(path, filesep, string(name(i)))) );
      Features(i,:) = getFeatures(img);
end


%% Path to the underwater image dataset directory
img_path = 'C:\Users\admin\Desktop\UIF数据集和MOS\';
ext = {'*.jpeg','*.jpg','*.png','*.pgm', '*.tif','*.bmp'};
img_path_list = [];
img_path_list_ = [];

for i = 1: length(ext)
    img_path_list_ = dir([img_path, ext{i}]);
    img_path_list = [img_path_list;img_path_list_];
end
img_num = length(img_path_list);
Score = zeros(img_num, 1);
metric_name = cell(img_num);
if img_num > 0
    for i = 1: img_num
        img_name = img_path_list(i).name;
        fprintf('%d %s\n',i,strcat(img_path, img_name));
        % Read Image
        img = imread([img_path, img_name]);
        cell_str = strsplit(img_name, '.');
        name = cell_str{1, 1};
        type = cell_str{1, 2};
        metric_name{i} = name;
        %Feature Extraction
        Features(i,:) = getFeatures(img);
     
    end
end


% train-test process

for i=1:1
    disp(i);
    [Train, Test] = splitTrainTest(name);

    TrainFeatures = Features(Train,:);
    TestFeatures  = Features(Test,:);
    
     YTest = MOS(Test);
     YTrain= MOS(Train);
 
     Mdl = fitrgp(TrainFeatures,YTrain,'KernelFunction','rationalquadratic','Standardize',true);
     Pred= predict(Mdl,TestFeatures);
     

end



