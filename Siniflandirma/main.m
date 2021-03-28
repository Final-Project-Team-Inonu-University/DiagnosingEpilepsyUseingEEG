clear all;
%%
datas = xlsread('Data/Karisik veri seti(A-E).xlsx');
dogruString = {'Data/Saglikli','Hasta','Saglikli','Hasta','Hasta','Saglikli','Hasta','Saglikli','Saglikli','Hasta'};
[row,column] = size(datas); 
% %----------------------------------------------
%% bandpass filtering
for data=1:column
    datas(:,data)=FilterBandpass(datas(:,data));
end
%% wavelet transform için kullanilacak dalga boyu iliskisi en yüksek olan dalgaboyu seçilecek 
%  Ozellik cikarimi
SignFeature = zeros(6,column);
for i=1:column
    [D1,D2,D3,D4,D5,D6,D7,D8,A8] = DalgacikDonusumu(datas(:,i));
    SignFeature(:,i)=FeaturesExport(D5);%Beta sinyalini çýkarýyoruz.
    %name=strcat(dogruString{i},int2str(i));
    %PlotEeg(D1,D2,D3,D4,D5,D6,D7,D8,A8,name)
end
%%  K-means and calculate correction
countTry=10;
toplam = 0;
for j=1:countTry
    [class,center]=kMeans(SignFeature,2);
    toplam = toplam + AECorrection(class);
    %PlotEeg(D1,D2,D3,D4,D5,D6,D7,D8,A8,name)
end
%%
fprintf('\n %d deneme sonucu elde edilen doðruluk oraný: %f \n',countTry,toplam/countTry);