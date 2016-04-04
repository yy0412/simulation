function path = getShortestPath(startPoint,endPoint,UG)
[~,path,~] = graphshortestpath(UG,startPoint,endPoint,'directed',false);
end