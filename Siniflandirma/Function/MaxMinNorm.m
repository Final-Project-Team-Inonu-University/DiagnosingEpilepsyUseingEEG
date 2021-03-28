function x = MaxMinNorm(liste)
    shape =size(liste);
    countExmpl = shape(2);
    if countExmpl > 1
        for i = 1:countExmpl
            x(:,i) = (liste(: ,i)-min(liste(: ,i)))/(max(liste(: ,i))-min(liste(: ,i)));
        end
    else
        x = (liste-min(liste))/(max(liste)-min(liste));
    end