function ComparsionArray = ComputeDistance(Features,SceneIndex,ExamplesObject,TileSize)
s = size(Features);
ComparsionArray = [];
for i = 1:s(2)
    values  = Features{i}.values;
    n       = Nearest(values,ExamplesObject);     
    Features{i}.NearestExamples = n;    
    f       = Features{i}.start;
    ComparsionArray =  [ComparsionArray;SceneIndex,f',TileSize',n];
end
