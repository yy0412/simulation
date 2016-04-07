function users=userMake(numberOfUsers,flats)
%间距还需调整
xStreet=[0,16,216,232,382,398,473,489,564,580];
yStreet=[0,16,166,182,198,273,348,364];
%Worker（30%）和Visitor(20%）
othergates=[0,176;0,265;580,176;580,265;224,0;224,364;390,0;390,364;481,0;481,364];
gates=[othergates;0,0;0,364;580,0;580,364];%14个
Workers=[;];
Visitors=[;];
numberOfWorkers=numberOfUsers*0.3;
numberOfVisitors=numberOfUsers*0.2;
for i=1:numberOfWorkers
    id=randperm(14,1);
    Workers=[Workers;gates(id,:)];% workers=users(1:numberOfUsers*0.3,:);%18(1-18)
end
for i=1:numberOfVisitors
    id=randperm(14,1);
    Visitors=[Visitors;gates(id,:)];%visitors=users(numberOfUsers*0.7+1:numberOfUsers*0.9,:);%12(43-54)
end
%Resident(40%）和RoamingResident(10%）
numberOfResidents=numberOfUsers*0.4;%residents=users(numberOfUsers*0.3+1:numberOfUsers*0.7,:);%24(19-42)
numberOfRoamingresidents=numberOfUsers*0.1;%roamingresidents=users(numberOfUsers*0.9+1:numberOfUsers,:);%6(55-60)
Residents=[;];
Roamingresidents=[;];
for i=1:numberOfResidents
    id=randperm(10,1);
    Residents=[Residents;flats(id,:)];
end
for i=1:numberOfRoamingresidents
    id=randperm(10,1);
    Roamingresidents=[Roamingresidents;flats(id,:)];
end
users(1:18,:)=Workers;
users(19:42,:)=Residents;
users(43:54,:)=Visitors;
users(55:60,:)=Roamingresidents;
% for j=1:numberOfUsers
%     plot(users(j,1),users(j,2),'.');
%     hold on;
% end
end


