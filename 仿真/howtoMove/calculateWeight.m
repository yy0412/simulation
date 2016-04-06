function [UG,W]=calculateWeight(pois)
%calculateWeight
W=[];
Vector1=[];
Vector2=[];
for i=1:size(pois,1)
    Minus1=[];
    Minus2=[];
    for j=(1+1):size(pois,1)
        if pois(j,1)==pois(i,1)
            Minus1(j)=pois(j,2)-pois(i,2);
        end
        if pois(j,2)==pois(i,2)
            Minus2(j)=pois(j,1)-pois(i,1);
        end
    end
    a=min(Minus1(find(Minus1>0)));
    if size(a,2)~=0  a=find(Minus1==a);end
    b=max(Minus1(find(Minus1<0)));
    if size(b,2)~=0  b=find(Minus1==b);end
    c=min(Minus2(find(Minus2>0)));
    if size(c,2)~=0  c=find(Minus2==c);end
    d=max(Minus2(find(Minus2<0)));
    if size(d,2)~=0  d=find(Minus2==d);end
    f=[a,b,c,d];
    for k=1:size(f,2)
        W=[W,abs(pois(i,2)-pois(f(k),2))+abs(pois(i,1)-pois(f(k),1))];
        Vector1=[Vector1,i];
        Vector2=[Vector2,f(k)];
    end
end
%权值和边对应得到UG
UG = sparse(Vector1,Vector2,W);
end