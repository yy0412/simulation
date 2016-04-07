%initial the parameters of network
record_time=0;                %record the number of interval time of system
[pois,poisofRoamingResidents,gates,restaurants,shops,offices,flats]=PIOArrange();
[UG,W]=calculateWeight(pois);
%部署微微基站和家庭基站
numberofHeNB=30;%numberofHeNB=30:30:120;%numberofeNB=4;
[eNBs,HeNBs]=baseStationArrange(numberofHeNB);%BaseStations=[eNBs;HeNBs];
%用户撒点
numberOfUsers=60;%应该是60个
users=userMake(numberOfUsers,flats);
%初始化切换统计矩阵
count_handover_number=zeros(numberofHeNB);
for u=1:numberOfUsers
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
                    count_handover_number(theServiceBaseStationNew,theServiceBaseStation)=count_handover_number(theServiceBaseStationNew,theServiceBaseStation)+1;
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