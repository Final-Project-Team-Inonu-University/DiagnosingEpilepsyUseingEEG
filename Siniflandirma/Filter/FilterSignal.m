function [FIR,IIR,BAND]=FilterSignal(signal)
    shape = size(signal);
    ExmplCount = shape(2);
    AttrbCount = shape(1);
    
    FIR=rand(AttrbCount,ExmplCount);
    FIRLP=getFilterFIRLP;
    IIR=rand(AttrbCount,ExmplCount);
    IIRLP=getFilterIIRLP;
    BAND=rand(AttrbCount,ExmplCount);
    BANDPASS=getFilterBANDPASS;
    for i=1:ExmplCount
        FIR(:,i)=filter(FIRLP,signal(:,i));
    end
    for i=1:ExmplCount
        IIR(:,i)=filter(IIRLP,signal(:,i));
    end
    for i=1:ExmplCount
        BAND(:,i)=filter(BANDPASS,signal(:,i));
    end
end