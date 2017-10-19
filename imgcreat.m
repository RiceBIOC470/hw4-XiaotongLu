function outp=imgcreat
a=rand(1024,1024);
img=im2uint8(a);
imwrite(img,'newimage.tif','tif');
outp=imread('newimage.tif');
imshow(outp);
end