%Мейн прога, снимаем график I(lambda) со спектра
%%%
clc;
clear;
I = imread ('2021-10-15-22-15-22PiShots_CUT.jpg');
%%I = imread ('PlotMultisegmentLineFromImageExample_01.png');

[height, width, dim] = size(I);
x = (0:width-1);
y = (0:height-1);


imshow(I)
Full = improfile(width);

Full_plot = Full (:,1,1);
plot(x,Full_plot)