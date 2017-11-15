function work =  getpaths(experiment)
        c = cd ;
        s = strfind(c,'\');
        outerpath = c(1:s(end-2)-1);
       
        work.TrainDataPath          = [outerpath,'\datafortest\offline\Train\'];
        
        work.TrainImagesPath        = [work.TrainDataPath,'images\'];
        work.TrainPolyPath          = [work.TrainDataPath,'polys\']; 
        
        work.signature              = [work.TrainDataPath,'signature\',num2str(experiment(4))];
        
        
        
        work.TestDataPath           = [outerpath,'\datafortest\offline\Test\'];
        
        work.Testsignature          = [work.TestDataPath,'signature\',num2str(experiment(1))];
        work.TestResults            = [work.TestDataPath,'restults\',num2str(experiment(1))];       
        work.Testpolys              = [work.TestDataPath,'tifs\']; 
        
        work.subcodepath  = '\system';
       
        
       
        
       
        

       