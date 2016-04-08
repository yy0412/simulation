function RSS=calculate_RSS(user,baseStations)
%calculate the received signal strength
eNB_Tx_Powe=27;% dBm
HeNB_Tx_Power = 15; % dBm
attenuationofWalls=10;%dB
shadowingofeNB=8;%dBm
shadowingofHeNB=4;%dBm
RSS=[];
for b=1:size(baseStations)
    x_distance=user(1)-baseStations(b,1);
    y_distance=user(2)-baseStations(b,2);
    distance=sqrt(x_distance.^2+y_distance.^2);
    numberOfFloors=baseStations(b,4);
    switch baseStations(b,3)
        case 1
            scenario='HeNB';
            location='flat';
            PL = getPathLoss(distance,scenario,location,numberOfFloors);%calculate PL
            RSS(b)=HeNB_Tx_Power-PL-attenuationofWalls-shadowingofHeNB+11;%直接减那几个数对吗？还加不加天线增益
        case 2
            scenario='HeNB';
            location='office';
            PL = getPathLoss(distance,scenario,location,numberOfFloors);%calculate PL
            RSS(b)=HeNB_Tx_Power-PL-attenuationofWalls-shadowingofHeNB+11;%直接减那几个数对吗？
        case 3
            scenario='HeNB';
            location='shop';
            PL = getPathLoss(distance,scenario,location,numberOfFloors);%calculate PL
            RSS(b)=HeNB_Tx_Power-PL-attenuationofWalls-shadowingofHeNB+11;%直接减那几个数对吗？
        case 4
            scenario='HeNB';
            location='restaurant';
            PL = getPathLoss(distance,scenario,location,numberOfFloors);%calculate PL
            RSS(b)=HeNB_Tx_Power-PL-attenuationofWalls-shadowingofHeNB+11;%直接减那几个数对吗？
        case 5
            scenario='eNB';
            location=0;
            PL = getPathLoss(distance,scenario,location,numberOfFloors);%calculate PL
            RSS(b)=eNB_Tx_Powe-PL-attenuationofWalls-shadowingofeNB+11;
    end
end
end
