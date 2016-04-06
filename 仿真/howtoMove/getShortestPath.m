function path = getShortestPath(startPoint,endPoint,UG)
% h = view(biograph(UG,[],'ShowArrows','off','ShowWeights','on'))
[~,path,~] = graphshortestpath(UG,startPoint,endPoint,'directed',false);
end