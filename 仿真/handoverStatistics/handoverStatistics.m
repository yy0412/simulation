%initial the parameters of network
clear
clc
% h_HeNB = 1+3*(Floor - 1);
% handover_clock=0;
%Tc=1;                      %time of measure interval 0.5
record_time=0;                %record the number of interval time of system
%countinue_run=true;
[pois,poisofRoamingResidents,gates,restaurants,shops,offices,flats]=PIOArrange();
%部署微微基站和家庭基站
numberofHeNB=30;
count_handover_number=zeros(numberofHeNB);
%numberofHeNB=30:30:120;%numberofeNB=4;
[eNBs,HeNBs]=baseStationArrange(numberofHeNB);
%BaseStations=[eNBs;HeNBs];
%用户撒点
numberOfUsers=60;%应该是60个
users=userMake(numberOfUsers);
for u=1:numberOfUsers
    [UG,pois]=calculateWeight(users(u,:),pois);
    %选择服务基站
    [theServiceBaseStation,class]=findtheServiceBaseStation(users(u,:),eNBs,HeNBs);
    Path=howtoMove(users(u,:),u,UG,pois,poisofRoamingResidents,gates,restaurants,shops,offices,flats);
    while record_time<10
        PathSize=size(Path,2);
        %曼哈顿移动模型
        while PathSize>0
            des=Path(1);
            point=pois(des,:);
            while users(u,1)~=point(1)||users(u,2)~=point(2)
                users(u,:)=Manhattan_mobility_model(users(u,:),point);
                %重新选择服务基站
                [theServiceBaseStationNew,classNew]=findtheServiceBaseStation(users(u,:),eNBs,HeNBs);
                if theServiceBaseStationNew==theServiceBaseStation%&&strcmp(class,'HeNBs')&&strcmp(classNew,'HeNBs')%发生切换
                    count_handover_number(theServiceBaseStation,theServiceBaseStationNew)=count_handover_number(theServiceBaseStation,theServiceBaseStationNew)+1;
                    theServiceBaseStation=theServiceBaseStationNew;
                    class=classNew;
                end
                record_time=record_time+1;
            end
            Path(1)=[];
            PathSize=PathSize-1;
        end
    end
    %最后就是要一个count_handover_number的矩阵
end