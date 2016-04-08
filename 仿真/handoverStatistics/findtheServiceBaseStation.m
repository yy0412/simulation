function [theServiceBaseStation,class]=findtheServiceBaseStation(user,eNBs,HeNBs)
%计算RSS
RSSofeNBs=calculate_RSS(user,eNBs);
RSSofHeNBs=calculate_RSS(user,HeNBs);
%选服务基站
theServiceBaseStation1=1;
theServiceBaseStation2=1;
for i=1:size(RSSofeNBs,2)
    if RSSofeNBs(i)-2>RSSofeNBs(theServiceBaseStation1)%Hysteresis for handover [dB]
        theServiceBaseStation1=i;
    end
end
for j=1:size(RSSofHeNBs,2)
    if RSSofHeNBs(j)-2>RSSofHeNBs(theServiceBaseStation2)%Hysteresis for handover [dB]
        theServiceBaseStation2=j;
    end
end
if RSSofHeNBs(theServiceBaseStation2)<-90
    a=find(max(RSSofeNBs(theServiceBaseStation1),RSSofHeNBs(theServiceBaseStation2)));
    if a==1
        theServiceBaseStation=theServiceBaseStation1;
        class='eNBs';
    else
        theServiceBaseStation=theServiceBaseStation2;
        class='HeNBs';
    end
else
    theServiceBaseStation=theServiceBaseStation2;
    class='HeNBs';
end
end