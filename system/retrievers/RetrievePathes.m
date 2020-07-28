function channels =RetrievePathes(WorkPath,Fdirs,subworkpath)
channels = {};
c = 1;
s =  size(Fdirs);
for i = 1:s(2)
    SDir =  Fdirs{i};
    m = SDir.methods;
    semantic =  SDir.semantic;
    z =  size( m );
    for j = 1:z(2) 
     channels{c}.FeaturesChannel  = [WorkPath,'\',semantic,subworkpath,'\features\', m{j}.name];
     channels{c}.RetrievalChannel  = [WorkPath,'\',semantic,subworkpath,'\retrievals\', m{j}.name];     
     c  = c +1;  
    end    
end
