function Plot(N)
x=[];
y=[];
S=1:N;
for i=1:N
Intensity=MeanInten(i);
x(i)=mean(Intensity);
y(i)=std(Intensity);
end
plot(S,x);
hold on;
plot(S,y);
end

