function [oldClass,center] = kMeans(liste,sinifSayisi)
    shape =size(liste);
    countExmpl = shape(2);
    countAttrb = shape(1);
    class = randi(sinifSayisi,1,countExmpl);
    center = randi(1,countAttrb,sinifSayisi);
    oldClass = class;
    
    while true
        for i=1:sinifSayisi
            ortToplam = 0;
            toplamSinif = 0;
            for j=1:countExmpl
                if class(j) == i
                    ortToplam = ortToplam + liste(:,j);
                    toplamSinif = toplamSinif + 1;
                end
            end
            ortalama = ortToplam / toplamSinif;
            center(:,i) = ortalama;
        end

        for i=1:countExmpl
            toplam = (center(:,1)-liste(:,i)).^2;
            toplam = sum(toplam(:));
            toplam = sqrt(toplam);
            min=toplam;
            class(i) = 1;
            for j=2:sinifSayisi
                toplam2 = (center(:,j)-liste(:,i)).^2;
                toplam = sum(toplam2(:));
                toplam = sqrt(toplam);
                if toplam < min
                    min = toplam;
                    class(i) = j;
                end
            end
        end
        if oldClass == class
            break
        else
            oldClass = class;
        end
    end
end
    
    
    