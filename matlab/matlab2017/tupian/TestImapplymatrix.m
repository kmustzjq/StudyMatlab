RGB=imread('timg.jpg');
M=[0.3 0.59 0.11];
gray=imapplymatrix(M,RGB);
figure;
subplot(1,2,1),imshow(RGB),title('RGB');
subplot(1,2,2),imshow(gray),title('gray');