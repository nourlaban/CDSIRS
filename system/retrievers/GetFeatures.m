function  FeaturesObject =  GetFeatures(FeaturesChannel)
        
        FeaturesFiles =    shaperead([FeaturesChannel.fullpath,'\shpfeatures.shp']);
        s =  size(FeaturesFiles);
        FeaturesObject = {}; 
        for i = 1:numel(FeaturesFiles)
             datafeatures{i}.rect = FeaturesFiles(i).box;
             datafeatures{p}.values = FeaturesFiles(i).featurevector; 
            FileName =    FeaturesFiles(i).name;
            d = strfind(FileName,'.');
            scenename           = FileName(1:d-1);
            FilePath            = [FeaturesChannel.fullpath,'\',FileName];
            FileObject          = GetFileFeatures(scenename,FilePath);
            FeaturesObject{i}   = FileObject; 
        end

