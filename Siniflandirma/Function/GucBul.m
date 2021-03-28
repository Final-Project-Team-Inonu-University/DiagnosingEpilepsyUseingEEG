function GucBul(sinyal,name)
    normSinyal = MaxMinNorm(sinyal);
    guc = randi(100,length(sinyal),1);
    gucNormal = randi(100,length(sinyal),1);
    gucAnlik = randi(1,length(sinyal),1);
    before=0;
    beforeGuc=0;
    beforeNormal = 0;
    for i=1 : length(sinyal)
        guc(i) = sinyal(i) - before;
        before = sinyal(i);
        
        gucNormal(i) = normSinyal(i)-beforeNormal;
        beforeNormal = normSinyal(i);
        
        gucAnlik(i) =  gucNormal(i) - beforeGuc;
        beforeGuc = gucAnlik(i);
    end
    %------------------------------
    f = figure("name",name);
    subplot(3,1,1);
    plot(sinyal,'b');
    title("Sinyal Guc");
    xlabel("x ekseni");
    ylabel("y ekseni");
    legend("Sinyal");
    subplot(3,1,2);
    plot(gucAnlik ,'c');
    title("guc Anlik");
    xlabel("x ekseni");
    ylabel("y ekseni");
    subplot(3,1,3);
    plot(gucNormal,'g');
    title("guc");
    xlabel("x ekseni");
    ylabel("y ekseni");
end