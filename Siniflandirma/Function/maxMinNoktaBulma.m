function result = maxMinNoktaBulma(signal)
    shape = size(signal);
    result = [0,0];
    if shape(1)>1
        maxR = false;
        minR = false;
        for i = 2:shape(1)
            if signal(i-1) > signal(i) && ~maxR
                maxR = true;
                minR= false;
                %minimum nokta bulundugunda
                result(1) = result(1) + 1;
            elseif signal(i-1) < signal(i) && ~minR
                maxR = false;
                minR = true;
                %maximum nokta bulundugunda
                result(2) = result(2) + 1;
            end
        end
    end
    
end