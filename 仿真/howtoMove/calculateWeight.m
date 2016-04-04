function UG=calculateWeight(user,pois)%
%判断user是否在pois里，如果没有则加进去
a=0;
for k=1:size(pois,2)
if (user-pois(k,:))==[0,0]
    a=a+1;
end
end
if a==0
    pois=[pois;user];
end
%calculateWeight
W=[];
for i=1:size(pois)
    for j=1:size(pois)
    W(i,j)=abs(pois(i,1)-pois(j,1))+abs(pois(i,2)-pois(j,2));
    end
end
%权值和边对应得到UG
Vector1=[];
Vector2=[];
for i=1:size(pois)
    Vector1=[Vector1,i*ones(1,size(pois,1))];
    Vector2=[Vector2,1:size(pois,1)];
end
UG = sparse(Vector1,Vector2,W);
end