function Path=howtoMove(user,users,pois,gates,restaurants,shops,offices,flats)%？？？？取得的[x_user,y_user]还有问题
n=1;%dis_rand参数
UG=calculateWeight(user,pois);
PositioninUsers=findPositioninPOIs(user,users);
if 1<=PositioninUsers&&PositioninUsers<=18%worker-起始位置就在出入口，不用选入口-出口和入口一样
    Enter=user;
%-------------1.选目的地-----------------%4种不同用户的1和2不一样
    x_work=[restaurants;shops;offices];
    p_work=[0.05;0.05;0.05;0.05;0.4;0.4];
    destination=dis_rand(x_work,p_work,n);
    %-----------2.计算最短路程--------------
    %上班
x_onwork=[destination;shops];
p_onwork=[0.9,0.05,0.05];
destinationmidway_onwork=dis_rand(x_onwork,p_onwork,n);
Path_Midway_onwork=getShortestPath(findPositioninPOIs(Enter,pois),findPositioninPOIs(destinationmidway_onwork,pois),UG);
Path_onwork=[Path_Midway_onwork,getShortestPath(findPositioninPOIs(destinationmidway_onwork,pois),findPositioninPOIs(destination,pois),UG)];
%下班
x_offwork=[Enter;shops;restaurants];
p_offwork=[0.6,0.1,0.1,0.1,0.1];
destinationmidway_offwork=dis_rand(x_offwork,p_offwork,n);
Path_Midway_offwork=getShortestPath(findPositioninPOIs(user,pois),findPositioninPOIs(destinationmidway_offwork,pois),UG);
Path_onwork=[Path_Midway_onwork,getShortestPath(findPositioninPOIs(destinationmidway_onwork,pois),findPositioninPOIs(destination,pois),UG)];
Path_Midway_offwork=;
Path_offwork=;
elseif 19<=PositioninUsers&&PositioninUsers<=42%resident
        x_work=gates;
    p_work=1;
    destination=dis_rand(x_work,p_work,n);
elseif   43<=PositioninUsers&&PositioninUsers<=54%visitors
        x_work=[restaurants;shops;offices];
    p_work=[0.05;0.05;0.05;0.05;0.4;0.4];
    destination=dis_rand(x_work,p_work,n);
else 55<=PositioninUsers&&PositioninUsers<=60%roamingresidents
        x_work=[restaurants;shops;offices];
    p_work=[0.05;0.05;0.05;0.05;0.4;0.4];
    destination=dis_rand(x_work,p_work,n);
end

end