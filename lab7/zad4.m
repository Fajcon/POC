close all;
clearvars;
clc;
%%
••••••••
image = imread('calculator.bmp');

SE = ones(1,71);
imageEroded = imerode(image,SE);
imageReconstructed = imreconstruct(imageEroded,image);

figure();
subplot(1,3,1); imshow(image);                    title('oryginal');
subplot(1,3,2); imshow(imageReconstructed);       title('rekonstrukcja');
subplot(1,3,3); imshow(imopen(image,SE));              title('klasyczne otwarcie');

%% 
image2 = imabsdiff(image,imageReconstructed);

figure();
subplot(1,2,1); imshow(image2); title('roznica');
subplot(1,2,2); imshow(imtophat(image,SE)); title('tophat');

%%
SE2 = ones(1,11);
image2Eroded = imerode(image2,SE2);
image2Reconstructed = imreconstruct(image2Eroded,image2);

figure();
imshow(image2Reconstructed); title('rekonstrukcja');

%%
SE3 = ones(1,21);
image3 = imdilate(image2Reconstructed,SE3);
image3Reconstructed = imreconstruct(min(image3,image2),image2);

figure();
subplot(1,2,1); imshow(image); title('oryginał');
subplot(1,2,2); imshow(image3Reconstructed); title('wynik');