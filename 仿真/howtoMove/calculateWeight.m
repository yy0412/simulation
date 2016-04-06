function [UG,W]=calculateWeight(pois)
%calculateWeight
W=[];
Vector1=[];
Vector2=[];
for i=1:size(pois)
    a=find(pois(:,1)==pois(i,1));
    %a=setdiff(a,i);
    aMinusI=pois(a,2)-pois(i,2);
    fa=[];
    if size(find(aMinusI>0))~=0
        f1=find(aMinusI==min(aMinusI(find(aMinusI>0))));%找到的这个数是它在pois里的位置
        fa=[fa,a(f1)];
    end
    if size(find(aMinusI<0))~=0
        f2=find(aMinusI==max(aMinusI(find(aMinusI<0))));
        fa=[fa,a(f2)];
    end
    if size(fa)~=0
        for j=1:size(fa)
            W=[W,abs(pois(i,2)-pois(fa(j),2))];
            Vector1=[Vector1,i];
            Vector2=[Vector2,fa(j)];
        end
    end
    
    b=find(pois(:,2)==pois(i,2));
    %b=setdiff(b,i);
    bMinusI=pois(b,1)-pois(i,1);
    fb=[];
    if size(find(bMinusI>0))~=0
        f1=find(bMinusI==min(bMinusI(find(bMinusI>0))));%找到的这个数是它在pois里的位置
        fb=[fb,b(f1)];
    end
    if size(find(bMinusI<0))~=0
        f2=find(bMinusI==max(bMinusI(find(bMinusI<0))));
        fb=[fb,b(f2)];
    end
    if size(fb)~=0
        for j=1:size(fb)
            W=[W,abs(pois(i,1)-pois(fb(j),1))];
            Vector1=[Vector1,i];
            Vector2=[Vector2,fb(j)];
        end
    end
end
%权值和边对应得到UG
UG = sparse(Vector1,Vector2,W);
end