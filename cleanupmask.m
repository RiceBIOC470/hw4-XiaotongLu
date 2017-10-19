function img_dilate=cleanupmask(image)
img_bw=imdilate(image,strel('disk',12));
imshow(img_bw,[])
CC=bwconncomp(img_bw);
stats=regionprops(CC,'Area');
area=[stats.Area];
AA=mean(area)+std(area);
fusedcandidates=area>AA;
sublist=CC.PixelIdxList(fusedcandidates);
sublist=cat(1,sublist{:});
fusedmask=false(size(image));
fusedmask(sublist)=1;
s=round(1.2*sqrt(mean(area))/pi);
nucmin=imerode(fusedmask,strel('disk',s));
outside=~imdilate(fusedmask,strel('disk',5));
basin=imcomplement(bwdist(outside));
basin=imimposemin(basin,nucmin|outside);
pcolor(basin);shading flat;
L=watershed(basin);
imshow(L,[]);colormap('jet');caxis([0 20]);
BB=img_bw-fusedmask;
newmask=L>1|BB;
imshow(newmask,'InitialMagnification','fit');
imwrite(newmask,'D:\matlab_P3_4.tif','tif'); 
end
