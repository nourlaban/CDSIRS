function Objects =  RetrieveObjects(channels)
c = size(channels.FeaturesChannel);
Objects = {};
for i = 1:c(2)
   FeaturesObject               =   shaperead([channels.FeaturesChannel{i}.fullpath,'\featureshp.shp']);
    for j = 1:numel(FeaturesObject)
        FeaturesObject(j).Id = j; 
    end   
   Objects{i}.FeaturesObject    =   FeaturesObject; 
   Objects{i}.tilesize          =   channels.FeaturesChannel{i}.tilesize;
   Objects{i}.methods           =   channels.FeaturesChannel{i}.methods;
end







