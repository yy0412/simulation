function [pois,poisofRoamingResidents,gates,restaurants,shops,offices,flats]=PIOArrange()
%设置POIs
x=[0,16,216,232,382,398,473,489,564,580];
y=[0,16,166,182,198,273,348,364];
pois=[;];
poisofRoamingResidents=[;];
for i=1:10
    for j=1:8
        pois=[pois;x(i),y(j)];
    end
end
for i=2:9
    for j=2:7
        poisofRoamingResidents=[poisofRoamingResidents;x(i),y(j)];
    end
end
othergates=[0,176;0,265;580,176;580,265;224,0;224,364;390,0;390,364;481,0;481,364];
restaurants=[216,207;100,16];%两个
shops=[524,273;398,30];%两个
offices=[473,140;232,300];%两个
flats=[16,197;232,330;398,46;382,132;489,230;580,36;162,166;317,198;555,348;91,102];
% for i=1:5%10个，循环5次，每次产生两个
% num1=randperm(10,1);
% flats=[flats;x(num1),round(364*rand())];
% num2=randperm(8,1);
% flats=[flats;round(580*rand()),y(num2)];
% end
pois=[pois;othergates;flats;offices;shops;restaurants;];
gates=[othergates;0,0;0,364;580,0;580,364];%14个
% for j=1:size(flats)
%     plot(flats(j,1),flats(j,2),'.');
%     hold on;
% end
end