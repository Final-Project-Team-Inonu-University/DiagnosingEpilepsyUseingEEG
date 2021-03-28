function [dogruluk]=AECorrection(class)
    dogruString = {'Saglikli','Hasta','Saglikli','Hasta','Hasta','Saglikli','Hasta','Saglikli','Saglikli','Hasta'};
    correctClass = [1,2,1,2,2,1,2,1,1,2];
    correctClass2 = [2,1,2,1,1,2,1,2,2,1];

    sonuc = class-correctClass;
    sonuc2 = class-correctClass2;
    OrnekSayisi = 10;
    puan = 0;
    for i =1:OrnekSayisi
        if 0 == sonuc(i)
           puan = puan + 1;
        end
    end
    puan = puan/OrnekSayisi;
    puan2 = 1 - puan;
    yRenk = 2; 
    if puan2 > puan
        dogruluk = puan2;
        fprintf('Dogruluk orani :%f \n',dogruluk);
        for i=1:OrnekSayisi
            if 0 == sonuc2(i)
                fprintf(' %s ',dogruString{i});
            else
                if strcmp(dogruString(i),'Hasta')
                    fprintf(yRenk,' - Saglikli ');
                else
                    fprintf(yRenk,'- Hasta ');
                end
            end
            fprintf(' ');
        end
    else
        ters = false;
        dogruluk = puan;
        fprintf('Dogruluk orani :%f \n',dogruluk);
        for i=1:OrnekSayisi
            if 0 == sonuc(i)
                fprintf(' %s ',dogruString{i});
            else
                if strcmp(dogruString(i),'Hasta')
                    fprintf(yRenk,'- Saglikli ');
                else
                    fprintf(yRenk,'- Hasta ');
                end
            end
            fprintf(' ');
        end
        fprintf('\n')
    end
end