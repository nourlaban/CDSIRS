function nextstage =WriteResults(work,super,samearray,Featuresmethod,retreive,nextstage,roundpath,privousshpsbuffer,stage)
        datarects       = samearray.datarects;
        s               = size(datarects);
        SortedArray     =  sortrows(datarects, s(2) );
        fullpath        = [work.WorkPath,work.subworkpath,work.retrievals,super.area,stage,roundpath ...
                                                  ,'\',super.method,'\',super.engine,'\', super.trainoverlap];
        fullpathbufer        = [fullpath,'\buffer'];
        
       
        mkdir(fullpath);
        mkdir(fullpathbufer);
        
        nextstage =writesubshp(fullpath,SortedArray,retreive,nextstage,super,roundpath,privousshpsbuffer);
         if(isempty(roundpath))
            shapewrite(super.wholetest,[fullpath,'\test.shp']);
            shapewrite(super.wholetrain,[fullpath,'\train.shp']);
            shapewrite(Featuresmethod.FeaturesObject,[fullpath,'\whole.shp']);
         end
    
   
      
   
 






