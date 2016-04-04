function PositioninPOIs=findPositioninPOIs(point,pois)
start=abs(pois(:,1)-point(1))+abs(pois(:,2)-point(2));
PositioninPOIs=find(start==0);
end