%HW4
%% 
% Problem 1. 
%GB comments:

1a 100
1b 100
1c 100
1d 50 No explanation of the results as the question asks. 
2a 100
2b. 100 
3a. 100
3b 100
3c 100
3d 100
3e 100
4a. 100
4b. 100
 Overall = 96

% 1. Write a function to generate an 8-bit image of size 1024x1024 with a random value 
% of the intensity in each pixel. Call your image rand8bit.tif. 
%Xiaotong Lu
I=imgcreat;

% 2. Write a function that takes an integer value as input and outputs a
% 1024x1024 binary image mask containing 20 circles of that size in random
% locations
%Xiaotong Lu
J=binarymask(N);

% 3. Write a function that takes the image from (1) and the binary mask
% from (2) and returns a vector of mean intensities of each circle (hint: use regionprops).
%Xiaotong Lu
K=MeanInten(N);

% 4. Plot the mean and standard deviation of the values in your output
% vector as a function of circle size. Explain your results. 
%Xiaotong Lu
Plot(N);

%%

%Problem 2. Here is some data showing an NFKB reporter in ovarian cancer
%cells. 
%https://www.dropbox.com/sh/2dnyzq8800npke8/AABoG3TI6v7yTcL_bOnKTzyja?dl=0
%There are two files, each of which have multiple timepoints, z
%slices and channels. One channel marks the cell nuclei and the other
%contains the reporter which moves into the nucleus when the pathway is
%active. 
%
%Part 1. Use Fiji to import both data files, take maximum intensity
%projections in the z direction, concatentate the files, display both
%channels together with appropriate look up tables, and save the result as
%a movie in .avi format. Put comments in this file explaining the commands
%you used and save your .avi file in your repository (low quality ok for
%space). 
%Xiaotong Lu
Save in my repository.
1:open movie1.tif & movie.tif;
1:image/stacks/tools/Z project /Max Intensity
2:image/stacks/tools/concatentate max_moive1 & max_movie2
3:image/color/merge channels/red: concatentate & green:concatentate
4:image/adjust/brightness/contrast

%Part 2. Perform the same operations as in part 1 but use MATLAB code. You don't
%need to save the result in your repository, just the code that produces
%it. 
%Xiaotong Lu
V=VideoWriter('D:\Matlab_Video.avi');
open(V);
I1='nfkb_movie1.tif';
I2='nfkb_movie2.tif';
reader1=bfGetReader(I1);
reader2=bfGetReader(I2);
nz=reader1.getSizeZ;
nt=reader1.getSizeT;
nz2=reader2.getSizeZ;
nt2=reader2.getSizeT;

for t=1:nt
    Ind1=reader1.getIndex(0,0,t-1)+1;
    Ind1_2=reader1.getIndex(0,1,t-1)+1;
    img_max1=bfGetPlane(reader1,Ind1);
    img_max1_2=bfGetPlane(reader1,Ind1_2);
    for z=2:nz
        Ind1=reader1.getIndex(z-1,0,t-1)+1;
        imgnow1=bfGetPlane(reader1,Ind1);
        img_max1=max(img_max1,imgnow1);
        Ind1_2=reader1.getIndex(z-1,1,t-1)+1;
        imgnow1_2=bfGetPlane(reader1,Ind1_2);
        img_max1_2=max(img_max1_2,imgnow1_2);
       
    end 
      %imwrite(imgfile1,'D:\matlab_movie1.tif','tif');
      imgfile1=cat(3,imadjust(img_max1),imadjust(img_max1_2),zeros(size(img_max1)));
      imgfile1_double=im2double(imgfile1);
      writeVideo(V,imgfile1_double);
end
for tt=1:nt2
    Ind2=reader2.getIndex(0,0,tt-1)+1;
    Ind2_2=reader2.getIndex(0,1,tt-1)+1;
    img_max2=bfGetPlane(reader2,Ind2);
    img_max2_2=bfGetPlane(reader2,Ind2_2);
    for zz=2:nz2
        Ind2_1=reader2.getIndex(zz-1,0,tt-1)+1;
        imgnow2_1=bfGetPlane(reader2,Ind2_1);
        img_max2=max(img_max2,imgnow2_1);
        Ind2_2=reader2.getIndex(zz-1,1,tt-1)+1;
        imgnow2_2=bfGetPlane(reader2,Ind2_2);
        img_max2_2=max(img_max2_2,imgnow2_2);
    
    end  
        %imwrite(imgfile2,'D:\matlab_movie1.tif','tif','WriteMode','append');
        imgfile2=cat(3,imadjust(img_max2),imadjust(img_max2_2),zeros(size(img_max2)));
        imgfile2_double=im2double(imgfile2);
        writeVideo(V,imgfile2_double)
end
close(V)



%%

% Problem 3. 
% Continue with the data from part 2
% 
% 1. Use your MATLAB code from Problem 2, Part 2  to generate a maximum
% intensity projection image of the first channel of the first time point
% of movie 1.
%Xiaotong Lu
I1='nfkb_movie1.tif';
reader1=bfGetReader(I1);
nz=reader1.getSizeZ;
Ind1=reader1.getIndex(0,0,0)+1;
img_max1=bfGetPlane(reader1,Ind1);
for z=2:nz
        Ind1=reader1.getIndex(z-1,0,0)+1;
        imgnow1=bfGetPlane(reader1,Ind1);
        img_max1=max(img_max1,imgnow1);
end
imwrite(img_max1,'D:\matlab_movie1.tif','tif');
% 2. Write a function which performs smoothing and background subtraction
% on an image and apply it to the image from (1). Any necessary parameters
% (e.g. smoothing radius) should be inputs to the function. Choose them
% appropriately when calling the function.
%Xiaotong Lu
I2=imread('D:\matlab_movie1.tif');
HW_3_2=Smoothimg(I2,100);

% 3. Write  a function which automatically determines a threshold  and
% thresholds an image to make a binary mask. Apply this to your output
% image from 2.
%Xiaotong Lu
img=imread('D:\matlab_P3_2.tif');
HW_3_3=autobinary(img);


% 4. Write a function that "cleans up" this binary mask - i.e. no small
% dots, or holes in nuclei. It should line up as closely as possible with
% what you perceive to be the nuclei in your image. 
%Xiaotong Lu
image=imread('D:\matlab_P3_3.tif');
HW_3_4=cleanupmask(image);



% 5. Write a function that uses your image from (2) and your mask from 
% (4) to get a. the number of cells in the image. b. the mean area of the
% cells, and c. the mean intensity of the cells in channel 1.
%Xiaotong Lu
Iimg=imread('D:\matlab_P3_4.tif');
Jimg=imread('D:\matlab_P3_2.tif');
[number,meanarea,meanInten]=infocell(Iimg,Jimg);


% 6. Apply your function from (2) to make a smoothed, background subtracted
% image from channel 2 that corresponds to the image we have been using
% from channel 1 (that is the max intensity projection from the same time point). Apply your
% function from 5 to get the mean intensity of the cells in this channel. 
%Xiaotong Lu
I1='nfkb_movie1.tif';
reader1=bfGetReader(I1);
nz=reader1.getSizeZ;
Ind2=reader1.getIndex(0,1,0)+1;
img_max1=bfGetPlane(reader1,Ind2);
for z=2:nz
        Ind2=reader1.getIndex(z-1,1,0)+1;
        imgnow2=bfGetPlane(reader1,Ind2);
        img_max1=max(img_max1,imgnow2);
        imwrite(img_max1,'D:\matlab_movie2.tif','tif');
end
I_channel_2=imread('D:\matlab_movie2.tif');
C2_1=Smoothimg(I_channel_2,100);
[~,~,meanInten]=infocell(C2_1,I_channel_2);
%%
% Problem 4. 

% 1. Write a loop that calls your functions from Problem 3 to produce binary masks
% for every time point in the two movies. Save a movie of the binarymasks.
%Xiaotong Lu
V=VideoWriter('D:\Matlab_Video_4_1.avi');
open(V);
I1='nfkb_movie1.tif';
I2='nfkb_movie2.tif';
reader1=bfGetReader(I1);
reader2=bfGetReader(I2);
nz=reader1.getSizeZ;
nt=reader1.getSizeT;
nz2=reader2.getSizeZ;
nt2=reader2.getSizeT;

for t=1:nt
    Ind1=reader1.getIndex(0,0,t-1)+1;
    img_max1=bfGetPlane(reader1,Ind1);
    for z=2:nz
        Ind1=reader1.getIndex(z-1,0,t-1)+1;
        imgnow1=bfGetPlane(reader1,Ind1);
        img_max1=max(img_max1,imgnow1);
    end
    imwrite(img_max1,'D:\matlab_movie1.tif','tif');
    A=Smoothimg(img_max1,100);
    C=imread('D:\matlab_P3_2.tif');
    D=imadjust(C);
    B=autobinary(D);
    E=cleanupmask(B);
    E_double=im2double(E);
    writeVideo(V,E_double);
end
for tt=1:nt2
    Ind2=reader2.getIndex(0,0,tt-1)+1;
    img_max2=bfGetPlane(reader2,Ind2);
    for zz=2:nz2
        Ind2=reader1.getIndex(zz-1,0,tt-1)+1;
        imgnow2=bfGetPlane(reader1,Ind2);
        img_max2=max(img_max2,imgnow2);
    end
        imwrite(img_max2,'D:\matlab_movie1.tif','tif');
        A2=Smoothimg(img_max2,100);
        C2=imread('D:\matlab_P3_2.tif');
        D2=imadjust(C2);
        B2=autobinary(D2);
        E2=cleanupmask(B2);
        E2_double=im2double(E2);
        writeVideo(V,E2_double);
end
close(V)

% 2. Use a loop to call your function from problem 3, part 5 on each one of
% these masks and the corresponding images and 
% get the number of cells and the mean intensities in both
% channels as a function of time. Make plots of these with time on the
% x-axis and either number of cells or intensity on the y-axis. 
%Xiaotong Lu
I1='nfkb_movie1.tif';
I2='nfkb_movie2.tif';
reader1=bfGetReader(I1);
reader2=bfGetReader(I2);
nz=reader1.getSizeZ;
nt=reader1.getSizeT;
nz2=reader2.getSizeZ;
nt2=reader2.getSizeT;
MI1=[];
NU1=[];
MI2=[];
NU2=[];
for c=1:2
  for t=1:nt
    Ind1=reader1.getIndex(0,c-1,t-1)+1;
    img_max1=bfGetPlane(reader1,Ind1);
        for z=2:nz
            Ind1=reader1.getIndex(z-1,0,t-1)+1;
            imgnow1=bfGetPlane(reader1,Ind1);
            img_max1=max(img_max1,imgnow1);
        end
    imwrite(img_max1,'D:\matlab_movie1.tif','tif');
    A=Smoothimg(img_max1,100);
    C=imread('D:\matlab_P3_2.tif');
    D=imadjust(C);
    B=autobinary(D);
    E=cleanupmask(B);
    [number,~,meanInten]=infocell(E,img_max1);
    NU1=[number,NU1];
    MI1=[meanInten,MI1];
 end
 for tt=1:nt2
    Ind2=reader2.getIndex(0,c-1,tt-1)+1;
    img_max2=bfGetPlane(reader2,Ind2);
        for zz=2:nz2
            Ind2=reader1.getIndex(zz-1,c-1,tt-1)+1;
            imgnow2=bfGetPlane(reader1,Ind2);
            img_max2=max(img_max2,imgnow2);
        end
     imwrite(img_max2,'D:\matlab_movie1.tif','tif');
     A2=Smoothimg(img_max2,100);
     C2=imread('D:\matlab_P3_2.tif');
     D2=imadjust(C2);
     B2=autobinary(D2);
     E2=cleanupmask(B2);
     [number2,~,meanInten2]=infocell(E2,img_max2);
     NU2=[number,NU2];
     MI2=[meanInten,MI2];
 end
end
T1=1:2*nt;
plot(T1,NU1,'r','MarkerSize',15);
xlabel('total timepoint of 2 channels')
ylabel('numbers')
hold on;
T2=1:2*nt2;
plot(T2,NU2,'b','MarkerSize',15)



