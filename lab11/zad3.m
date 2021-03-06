clearvars;
close all;
clc;

Img = imread('lunar.bmp');

Img_fft2 = fft2(Img);
Img_fftshift = fftshift(Img_fft2);

A = abs(Img_fftshift);
ampl = log10(A + 1);
faza = angle(Img_fftshift.*(A>0.0001));

figure(1);
subplot(1, 4, 1);
imshow(Img);
title('original');

subplot(1, 4, 2);
imshow(Img_fftshift);
title('fftshift');

subplot(1, 4, 3);
imshow(ampl, []);
title('amplituda');

subplot(1, 4, 4);
imshow(faza, []);
title('faza');

%%
th = 20;

imgfft2 = fft2(Img);
fft2abs = log10(abs(imgfft2)+1);
imgfft2(fft2abs > th) = 0;

figure;

subplot(1, 2, 1);
imshow(Img);
title('original');

subplot(1, 2, 2);
imshow(uint8(ifft2(ifftshift(imgfft2))), []);
title('filtrated');