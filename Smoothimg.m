function aimimg=Smoothimg(I,N)
%I=imread('D:\matlab_movie1.tif');
img_sm=imfilter(I,fspecial('gaussian',4,2));
img_bg=imopen(img_sm,strel('disk',N));
aimimg=imsubtract(img_sm,img_bg);
imwrite(aimimg,'D:\matlab_P3_2.tif','tif')
imshow(aimimg,[0 500]);
end

