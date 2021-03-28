function list= FeaturesExport(signal)
%%
%max, min, avr, standart devi., Energy, Power
    shape = size(signal);    
    list = zeros(6,shape(2));
%% 
    for i=1 : shape(2)
        temp = signal(:,i);
        list(1,i) = max(temp);                      %maximum point
        list(2,i) = min(temp);                      %minimum point
        list(3,i) = sum(temp)/shape(1);             %average of signal
        list(4,i) = std(temp);                      %standart sapma
        list(5,i) = sum(abs(temp).^2);              %enerji
        list(6,i) = (sum(temp.^2))/length(temp);    %power of signal 
    end
end