function MI=MeanInten(N)
%J=imread('HW4-3.fig');
imgcreat;
binarymask(N);
Control=imread('newimage.tif');
Maskimage=imread('Binarymask.tif');
property=regionprops(Maskimage,Control,'MeanIntensity');
MI=cat(1,property.MeanIntensity);
end