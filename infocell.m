function [number,meanarea,meanInten]=infocell(Iimg,Jimg)
%I=imread('D:\matlab_P3_4.tif');
%J=imread('D:\matlab_P3_2.tif');
cell_property=regionprops(Iimg,'Area','Centroid');
N=cat(1,cell_property.Centroid);
number=length(N);
area=[cell_property.Area];
meanarea=mean(area);
cell_property2=regionprops(Iimg,Jimg,'MeanIntensity');
meanInten=cat(2,cell_property2.MeanIntensity);
end


