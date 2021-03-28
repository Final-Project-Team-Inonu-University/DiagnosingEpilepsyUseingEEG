import Function.*;
import Filter.*;
import Data.*;

clear all;
%%
x = xlsread('Data\S50.xlsx');
y = xlsread('Data\Z99.xlsx');
datas = xlsread('Data\Karisik veri seti(A-E).xlsx');
dogruString = {'Saglikli','Hasta','Saglikli','Hasta','Hasta','Saglikli','Hasta','Saglikli','Saglikli','Hasta'};
[row,column] = size(datas); 
%%
% [FIR,IIR1,BAND1]=FilterSignal(x);
% [FIR,IIR2,BAND2]=FilterSignal(y);
% x = FilterBandpass(x);
% y = FilterBandpass(y);
% % % Wavelet transform deneme
% [D1,D2,D3,D4,D5,D6,D7,D8,A8] = DalgacikDonusumu(x);
% PlotEeg(D1,D2,D3,D4,D5,D6,D7,D8,A8,'Nobet Esnasi');
% [D1,D2,D3,D4,D5,D6,D7,D8,A8] = DalgacikDonusumu(y);
% PlotEeg(D1,D2,D3,D4,D5,D6,D7,D8,A8,'Saglikli');
% %----------------------------------------------
%% bandpass filtering
%[FIR,IIR,BAND]=FilterSignal(datas);
for data=1:column
    datas(:,data)=FilterBandpass(datas(:,data));
end
%% plot some signal after bandpass filter
subplot(2,1,1);
plot(datas(:,1),'r');
title('saglikli');
subplot(2,1,2);
plot(datas(:,2),'r');
title('hasta');

%% wavelet transform için kullanilacak dalga boyu iliskisi en yüksek olan dalgaboyu seçilecek 

deltaSign = zeros(row,column);
for i=1:column
    [D1,D2,D3,D4,D5,D6,D7,D8,A8] =DalgacikDonusumu(datas(:,i));
    deltaSign(:,i)=A8;%Beta sinyalini çýkarýyoruz.
    name=strcat(dogruString{i},int2str(i));
end

%% plot some signals after wavelet transform
figure(2)
subplot(2,1,1);
plot(deltaSign(:,1),'r');
title('saglikli');
subplot(2,1,2);
plot(deltaSign(:,2),'r');
title('hasta');
%% Ozellik cikarimi
list = FeaturesExport(deltaSign);

%%  K-means and calculate correction
[class,center]=kMeans(list,2);
AECorrection(class);