function BW=autobinary(img)
%I=imread('D:\matlab_P3_2.tif');
level = graythresh(img);
BW = imbinarize(img,level);
imwrite(BW,'D:\matlab_P3_3.tif','tif');
imshow(BW,[])
end