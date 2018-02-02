clear;
for iii=1:1000
i=imread(strcat('./data_use/TeG375/',num2str(iii),'.tif'));
[a,b]=find((i+1)==1);
[j,k]=find(i==1);
m=[a,b];
n=[j,k];
if isempty(n)~=1

       D=min(pdist2(m,n),[],2);
       d_max=max(max(D));
       D_final=D./d_max*255;
       pic=i*255;
       t=size(m,1);
    for ii=1:size(m,1)
       pic(m(ii,1),m(ii,2))=255-D_final(ii);
    end
else 
 
%     l=i >(d_max)*0.3;
%     i(l)=(d_max)*0.3;
    pic=i;
end
imwrite(pic,strcat('./',num2str(iii),'.tif'));
end