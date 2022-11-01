[FileName,PathName] = uigetfile('*.*','resim2.tif');
M=imread(FileName);
[FileName,PathName] = uigetfile('*.*','parametreler');
P=xlsread(FileName)
[FileName,PathName] = uigetfile('*.*','arazikoordinatlari');
AK=xlsread(FileName)
[FileName,PathName] = uigetfile('*.*','dönüklükmatrisi');
DM=xlsread(FileName)
satirpiksel=13824
sutunpiksel=7680
pikselboyu=12
for i=1:length(AK)
    %Resim Koordinatlari
    xresim(i)= (-P(1,1))*(DM(1,1)*(AK(i,2)-P(1,4))+DM(1,2)*(AK(i,3)-P(1,5))+DM(1,3)*(AK(i,4)-P(1,6)))/ (DM(3,1)*(AK(i,2)-P(1,4))+DM(3,2)*(AK(i,3)-P(1,5))+DM(3,3)*(AK(i,4)-P(1,6)))+P(1,2);
    yresim(i)= (-P(1,1))*(DM(2,1)*(AK(i,2)-P(1,4))+DM(2,2)*(AK(i,3)-P(1,5))+DM(2,3)*(AK(i,4)-P(1,6)))/ (DM(3,1)*(AK(i,2)-P(1,4))+DM(3,2)*(AK(i,3)-P(1,5))+DM(3,3)*(AK(i,4)-P(1,6)))+P(1,3);
    resim=[xresim' yresim'];
    % Piksel Koordinatlari
    xpiksel(i)= xresim(i)*(1000/pikselboyu)+sutunpiksel/2 ;
    ypiksel(i)= (-yresim(i))*(1000/pikselboyu)+satirpiksel/2 ;
    pxlkrd=[xpiksel' ypiksel'];
end
img=imread('resim2.tif');
imshow('resim2.tif')

hold on 
scatter(pxlkrd(:,1),pxlkrd(:,2),'r*');
xlabel ('X Ekseni','Fontsize',15,'Color','k');
ylabel ('Y Ekseni','Fontsize',15,'Color','k');
title ('Piksel Koordinatlarýnýn Resim Üzerinde Gösterimi','Color','r');
text(pxlkrd(1,1),pxlkrd(1,2),'10325629','Fontsize',10,'color','y')
text(pxlkrd(2,1),pxlkrd(2,2),'10326254','Fontsize',10,'color','y')
text(pxlkrd(3,1),pxlkrd(3,2),'10327982','Fontsize',10,'color','y')
text(pxlkrd(4,1),pxlkrd(4,2),'10337825','Fontsize',10,'color','y')
text(pxlkrd(5,1),pxlkrd(5,2),'10346865','Fontsize',10,'color','y')
text(pxlkrd(6,1),pxlkrd(6,2),'10347034','Fontsize',10,'Color','y')
text(pxlkrd(7,1),pxlkrd(7,2),'10347074','Fontsize',10,'color','y')
text(pxlkrd(8,1),pxlkrd(8,2),'10857363','Fontsize',10,'color','y')
text(pxlkrd(9,1),pxlkrd(9,2),'10861180','Fontsize',10,'color','y')
text(pxlkrd(10,1),pxlkrd(10,2),'12030078','Fontsize',10,'color','y')
