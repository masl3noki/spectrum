%%Попытка снять шум и получить I(lambda)
clc;
clear;
I = imread ('2021-10-15-21-01-07PiShots.jpg');
%%I = imread ('PlotMultisegmentLineFromImageExample_01.png');

%Предварительно размечаем график
[height, width, dim] = size(I);
x = (0:width-1);
y = (0:height-1);

%Коэффициент точности медианного фильтра
prec = 10;

%Выделяем каналы и применяем медианный фильтр:
redChannel = I(:, :, 1);
greenChannel = I(:, :, 2);
blueChannel = I(:, :, 3);
redMF = medfilt2(redChannel, [prec prec]);
greenMF = medfilt2(greenChannel, [prec prec]);
blueMF = medfilt2(blueChannel, [prec prec]);

%%%
%уберем шум ручками на графике:
max=50;
%Красный
for i = 1:height
    for j = 1:width
        if redMF(i,j) < max
            redMF(i,j) = 0;
        end
    end
end

%Зеленый
for i = 1:height
    for j = 1:width
        if greenMF(i,j) < max
            greenMF(i,j) = 0;
        end
    end
end

%Синий
for i = 1:height
    for j = 1:width
        if blueMF(i,j) < max
            blueMF(i,j) = 0;
        end
    end
end
%%%

%Получаем отфильтрованное изображение
rgbFixed = cat(3, redMF, greenMF, blueMF);

%Снимаем значения с отфильтрованного спектра:
imshow(rgbFixed)
improfile(width)