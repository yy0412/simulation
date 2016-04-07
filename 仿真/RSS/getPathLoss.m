function pl = getPathLoss(distance,scenario,location,numberOfFloors)
f=2000;%2GHz,但公式中的单位是MHz
h_MS=1.5;
switch scenario
    case 'eNB'% Okumura-Hata model from eNB to MS
        h_eNB=32;
        distance=distance/1000;%公式里距离单位是km而HeNB里的距离单位是m
        alpha=(1.1*log10(f)-0.7)*h_MS-(1.56*log10(f)-0.8);%对于中小城市
        pl=69.55+26.16*log10(f)-13.82*log10(h_eNB)-alpha+(44.9-6.55*log10(h_eNB))*log10(distance);% dB
    case 'HeNB'%P.1238-8 model from HeNB to MS
        d0=1;%m
        L(d0)=20*log10(f)-28;
        switch location
            case 'flat'%numberOfFloors1-5
                N=28;%distance power loss coefficient
                Lf=4*numberOfFloors;%floor penetration loss factor
                pl=L(d0)+N*log10(distance/d0)+Lf;%dB
            case 'office'%numberOfFloors=1
                N=30;
                Lf=15+4*(numberOfFloors-1);
                pl=L(d0)+N*log10(distance/d0)+Lf;%dB
            case 'shop'%numberOfFloors=1
                N=22;
                Lf=6 + 3 *(numberOfFloors-1);
                pl=L(d0)+N*log10(distance/d0)+Lf;%dB
            case 'restaurant'%numberOfFloors=1
                N=22;
                Lf=6 + 3 *(numberOfFloors-1);
                pl=L(d0)+N*log10(distance/d0)+Lf;%dB
        end
end
end