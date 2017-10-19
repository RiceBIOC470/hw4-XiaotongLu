function img_dilate=cleanupmask(image)
 img_dilate=imdilate(image,strel('disk',15));
 imwrite(img_dilate,'D:\matlab_P3_4.tif','tif');
 imshow(img_dilate,[])
end
