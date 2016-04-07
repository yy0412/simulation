function [theServiceBaseStation,class]=findtheServiceBaseStation(user,eNBs,HeNBs)
%计算RSS
RSSofeNBs=calculate_RSS(user,eNBs);
RSSofHeNBs=calculate_RSS(user,HeNBs);
%选服务基站
theServiceBaseStation1=1;
theServiceBaseStation2=1;
for i=1:size(RSSofeNBs)
    if RSSofeNBs(i)-4>theServiceBaseStation1%Hysteresis for handover [dB]
        theServiceBaseStation1=i;
    end
end
for j=1:size(RSSofHeNBs)
    if RSSofHeNBs(i)-4>theServiceBaseStation2%Hysteresis for handover [dB]
        theServiceBaseStation2=j;
    end
end
if RSSofeNBs(theServiceBaseStation1)>(RSSofHeNBs(theServiceBaseStation2)-100)%加多少？
    theServiceBaseStation=theServiceBaseStation1;
    class='eNBs';
else
    theServiceBaseStation=theServiceBaseStation2;
    class='HeNBs';
end
end