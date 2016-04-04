function drawTown(x_peak,y_peak,height)
width=[200,150,75,75];
for i=1:4
rectangle('Position',[x_peak,y_peak,width(i),height]);
hold on;
t=x_peak;
t=t+width(i)+16;
if (t<w_town-16-width(i))
rectangle('Position',[t,y_peak,width(i+1),height]);
hold on;
end
end