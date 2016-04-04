function y=dis_rand(x,p,n)
%dis_rand 产生离散分布随机坐标对儿
% x：可能取值
% p：取值概率
% n：拟生成坐标对儿的数目
cp=cumsum(p);
y=zeros(n,2);
for i=1:n
    y(i,:)=x(sum(cp<=rand(1))+1,:);
end

% 此函数修改得来的
% function y=dis_rand(x,p,n)
% %dis_rand 产生离散分布随机数
% % x：可能取值
% % p：取值概率
% % n：拟生成随机数的数目
% cp=cumsum(p);
% y=zeros(1,n);
% for i=1:n
%     y(i)=x(sum(cp<=rand(1))+1);
% end