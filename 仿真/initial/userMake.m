function users=userMake(numberOfUsers)
%间距还需调整
xStreet=[0,250,400,450,500];%把路从单根线改成了双根线，x,y分别添上增加16的（16，266，416等）
yStreet=[0,200,300,400];
users=[;];
for i=1:numberOfUsers/2
%选取纵向街道
numofVerticalStreet=randperm(5,1);%从1-5中，随机选一个数
users=[users;xStreet(numofVerticalStreet),round(400*rand())];%round保证用户的坐标也都是整数
%选取横向街道
numofHorizontalStreet=randperm(4,1);
users=[users;round(500*rand()),yStreet(numofHorizontalStreet)];
end
% for j=1:numberOfUsers
%     plot(users(j,1),users(j,2),'.');
%     hold on;
% end

%Worker（30%）、Resident（40%）、Visitor（20%）、Roaming resident（10%）
numberOfWorkers=numberOfUsers*0.3;%%worker\visitor最开始应该只是gates，但出入口要一样
workers=users(1:numberOfUsers*0.3,:);%18(1-18)
numberOfResidents=numberOfUsers*0.4;%从gates开始
residents=users(numberOfUsers*0.3+1:numberOfUsers*0.7,:);%24(19-42)
numberOfVisitors=numberOfUsers*0.2;
visitors=users(numberOfUsers*0.7+1:numberOfUsers*0.9,:);%12(43-54)%出入口都是gates，但要可以不一样
numberOfRoamingresidents=numberOfUsers*0.1;
roamingresidents=users(numberOfUsers*0.9+1:numberOfUsers,:);%6(55-60)最开始的点也是最后结束的点
end


