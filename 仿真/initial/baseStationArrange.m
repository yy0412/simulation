function [eNBs,HeNBs]=baseStationArrange(numberofHeNB)
w_town=580;
h_town=364;%改成300？
%drawTown(0,0,150)一共3个
rectangle('Position',[0,0,w_town,h_town]);hold on;
rectangle('Position',[16,16,200,150]);hold on;
rectangle('Position',[232,16,150,150]);hold on;
rectangle('Position',[398,16,75,150]);hold on;
rectangle('Position',[489,16,75,150]);hold on ;
rectangle('Position',[16,182,200,75]);hold on;
rectangle('Position',[16,273,200,75]);hold on;
rectangle('Position',[232,182,150,75]);hold on;
rectangle('Position',[232,273,150,75]);hold on;
rectangle('Position',[398,182,75,75]);hold on;
rectangle('Position',[398,273,75,75]);hold on;
rectangle('Position',[489,182,75,75]);hold on;
rectangle('Position',[489,273,75,75]);hold on;
axis equal;
axis off;
axis([0 580 0 364]);
%四个微微基站的位置坐标
eNBs=[100,340,5,1;240,50,5,1;375,340,5,1;550,190,5,1];
%设置HeNB
x=[21,237,403,494,211,377,468,559];%[16,232,398,489]+5;并上[216,382,473,564,]-5;
y=[21,187,278,161,193,343];%[16,182,273]+[5,5,5]并上[166,198,348]-[5,5,5]

HeNBs=[];
for i=1:numberofHeNB/2%每次产生两个
    num1=randperm(8,1);
    HeNBs=[HeNBs;x(num1),16+327*rand(),randperm(4,1),1];%第三列表示位置场景---1flat;2office;3shop;4restaurant
    num2=randperm(6,1);
    HeNBs=[HeNBs;16+543*rand(),y(num2),randperm(4,1),1];
end
%分配楼层,除了flat其他的楼层都为1
for numHeNB=1:size(HeNBs)
    if HeNBs(numHeNB,3)==1
        numoffloor=randperm(5,1);
        HeNBs(numHeNB,4)=numoffloor;
    end
end
%plot
for numeNB=1:size(eNBs)%画微微基站
    plot(eNBs(numeNB,1),eNBs(numeNB,2),'o');
    hold on;
end
for numHeNB=1:size(HeNBs)%画家庭基站
    plot(HeNBs(numHeNB,1),HeNBs(numHeNB,2),'X');
    hold on;
end
end