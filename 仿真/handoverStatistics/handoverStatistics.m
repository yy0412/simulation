function count_handover_number=handoverStatistics()
%initial the parameters of network
%nnnnnnn
clear
clc
% h_eNB=32;
% h_HeNB = 1+3*(Floor - 1);
% h_MS=1.5;
% speed=1;%1m/s
% handover_clock=0;
count_handover_number=[];
%Tc=1;                      %time of measure interval 0.5
record_time=0;                %record the number of interval time of system
%countinue_run=true;
%部署微微基站和家庭基站
numberofHeNB=5;
%numberofHeNB=30:30:120;%numberofeNB=4;
[eNBs,HeNBs]=baseStationArrange(numberofHeNB);
[pois,gates,restaurants,shops,offices,flats]=PIOArrange();
%BaseStations=[eNBs;HeNBs];
%用户撒点
numberOfUsers=30;%应该是60个
users=userMake(numberOfUsers);
while (record_time<100)
    for u=1:numberOfUsers
       %选择服务基站
       [theServiceBaseStation,class]=findtheServiceBaseStation(users(u,:),eNBs,HeNBs);
        %曼哈顿移动模型
        Path=howtoMove(users(u,:),users,pois,gates,restaurants,shops,offices,flats);
        users(u,:)=Manhattan_mobility_model(Path,pois);
        %重新选择服务基站
        [theServiceBaseStationNew,classNew]=findtheServiceBaseStation(users(u,:),eNBs,HeNBs);
        if theServiceBaseStationNew~=theServiceBaseStation&&strcmp(class,classNew)%发生切换
            count_handover_number(theServiceBaseStation,theServiceBaseStationNew)=count_handover_number(theServiceBaseStation,theServiceBaseStationNew)+1;
        end
    end
    record_time=record_time+1;
end
%最后就是要一个count_handover_number的矩阵
end