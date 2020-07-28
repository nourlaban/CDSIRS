function work =  getpaths(experiment)
        c = cd ;
        s = strfind(c,'\');
        innerpath = c(1:s(end)-1);
        outerpath = c(1:s(end-2)-1);
        source                      = {'aster','spot' 'aster2' 'landsat'};
       
        
       
        work.subworkpath            = ['\',source{experiment(1)},'\experiment',num2str(experiment(2))];        
        work.features               = ['\features\store'    ,num2str(experiment(3)),'\'];
        work.retrievals             = ['\retrievals\store'  ,num2str(experiment(4)),'\'];
        work.evaluates              = ['\valuates\store'    ,num2str(experiment(5)),'\'];
        
       
        
        work.DataPath                       = [outerpath,'\datafortest\',source{experiment(1)}];
        work.TrainTestPath.Object           = [cd,'\semantics\',source{experiment(1)},'\object'] ; 
        work.TrainTestPath.Area             = [cd,'\semantics\',source{experiment(1)},'\Area'] ; 
        work.WorkPath                       = [innerpath,'\work'];

       
        work.subcodepath  = '\system';