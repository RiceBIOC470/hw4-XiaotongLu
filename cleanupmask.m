function img_dilate=cleanupmask(image)
%I=imread('D:\matlab_P3_3.tif');
%J=uint16(I);
 %img_double=im2double(J);
 img_dilate=imdilate(image,strel('disk',15));
 %img_norm=img_double./img_dilate;img_double
 %img_norm_dilate=imdilate(img_norm,strel('disk',10));
 imwrite(img_dilate,'D:\matlab_P3_4.tif','tif');
 imshow(img_dilate,[])
end
