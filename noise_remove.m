% Убираем шум
%%%
p = imread('2021-10-15-21-01-07PiShots.jpg');
prec = 10;

redChannel = p(:, :, 1);
greenChannel = p(:, :, 2);
blueChannel = p(:, :, 3);

% Median Filter the channels:
redMF = medfilt2(redChannel, [prec prec]);
greenMF = medfilt2(greenChannel, [prec prec]);
blueMF = medfilt2(blueChannel, [prec prec]);

rgbFixed = cat(3, redMF, greenMF, blueMF);

imshowpair(p,rgbFixed,'montage');