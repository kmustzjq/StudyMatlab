[a,map]=imread('trees.tif');
gmap=rgb2gray(map);
%gmap=rgb2ind(map);%´íÎóµÄÓï·¨
%grgb=gray2rgb(gmap);
figure;
imshow(a);
figure;
imshow(a,gmap);
imwrite(a,gmap,'treegray.jpg')
imshow('timg3.jpg')

figure;
subplot(1,2,1)
imshow(a,map);
colorbar;
subplot(1,2,2)
imshow(a,[0 80]);
colorbar;


figure;
x1=imread('timg3.jpg');
imshow(x1)


figure;
[x2,map2]=imread('timg3.jpg');
imshow(x2,[0,80])