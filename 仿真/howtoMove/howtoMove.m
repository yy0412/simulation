function [destination,Path]=howtoMove(user,pois,gates,restaurants,shops,offices,flats)%worker的%？？？？取得的[x_user,y_user]还有问题
%######################去工作--worker起始位置就在出入口，所以不用选入口#
%-------------选入口-----------------
n=1;
enter=user;
exit=user;%出口--和入口一样
UG=calculateWeight(user,pois)
%-------------1.选工作地点-----------------%4种不同用户的1和2不一样
x=[restaurants;shops;offices];
p=[0.05;0.05;0.05;0.05;0.4;0.4];
destination=dis_rand(x,p,n);
%-----------2.计算最短路程--------------
x_onwork=[destination;shops];
p_onwork=[0.9,0.05,0.05];
destinationmidway=dis_rand(x_onwork,p_onwork,n);
Path_Midway=getShortestPath(findPositioninPOIs(user,pois),findPositioninPOIs(destinationmidway,pois),UG);
Path=[Path_Midway,getShortestPath(findPositioninPOIs(destinationmidway,pois),findPositioninPOIs(destination,pois),UG)];
end