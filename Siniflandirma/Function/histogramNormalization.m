function [NewValues,maxLim,minLim] = histogramNormalization(signal,max,min)
    shape = size(signal);
    aralik = 100;

    if nargin == 1
        minLim = 0;
        maxLim = 0;
        for i=1:shape(2)
            h1 = histogram(signal(:,i));
            h1.Visible = 'off';
            h1.BinWidth = aralik;
            if h1.BinLimits(1) < minLim
                minLim = h1.BinLimits(1) ;
            end
            if h1.BinLimits(2) > maxLim
                maxLim = h1.BinLimits(2);
            end
        end
    else
        minLim = min;
        maxLim = max;
    end
    
    
    toplamAralik = abs(maxLim-minLim);
    aralikSayisi = toplamAralik / aralik;
    NewValues = zeros(aralikSayisi,shape(2));

    for i=1:shape(2)
        h1 = histogram(signal(:,i));
        h1.Visible = 'off';
        h1.BinWidth = aralik;
        h1.BinLimits = [minLim,maxLim];
        NewValues(:,i) = h1.Values;
    end
end