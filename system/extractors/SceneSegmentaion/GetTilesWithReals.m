function tiles = GetTilesWithReals(FullPath,realinfo , scenesize)

        tiles               = SceneRects(realinfo , scenesize ,0,0);
        
        realinfo            = GetRealRelation(realinfo,tiles);
        tiles               =  excludereal(realinfo,tiles,1);
        
        realinfo            = GetRealRelation(realinfo,tiles);
        tiles               = excludereal(realinfo,tiles,2);
       

        s = size(realinfo);
        for i=1:s(2)
           realfileinfo =  realinfo{i};
            if (realfileinfo.path == FullPath)
               test =  realfileinfo.test;               
               t = size(test);
               for j = 1: t(2)
                   tiles{end+1}.rect    =   test{j}.rect(1:4);
                   tiles{end}.imagesize =   test{j}.rect(5:6);
                   tiles{end}.del       =   0; 
               end      

            end


        end















