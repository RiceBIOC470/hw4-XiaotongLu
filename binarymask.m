function S=binarymask(N)
img=false(1024);
for i=1:20
    x=randi(1024);
    y=randi(1024);
    img(x,y)=true;
end
img=imdilate(img,strel('sphere',N));
imwrite(img,'Binarymask.tif','tif');
S=imread('Binarymask.tif');
imshow(S);
end




