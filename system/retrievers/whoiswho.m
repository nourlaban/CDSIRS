function KonwnObject = whoiswho(FeaturesObjects,AreaObjects,nextrounds,index)
      KonwnObject = {};      
      s = size(index);
      t = 1;
        for j = 2:s(2)
            for i= 1:s(1)             
                    if(index(i,j) == -1 )
                       b =  FeaturesObjects(index(i,1));
                       name = AreaObjects{j-1}.name;
                       for k = 1:numel(nextrounds)
                           if(strcmp(name, nextrounds(k).area))
                               KonwnObject.Area{t}.method.FeaturesObject           =   b{1}.FeaturesObject;
                               KonwnObject.Area{t}.method.methods                  =   b{1}.methods;      
                               
                               KonwnObject.Area{t}.name                     =   name;
                               KonwnObject.Area{t}.wholetrain               =   AreaObjects{j-1}.Train;
                               KonwnObject.Area{t}.wholetest                =   AreaObjects{j-1}.Test;
                               KonwnObject.Area{t}.polyshpsbuffer           =   nextrounds(k).polyshpsbuffer;
                               KonwnObject.Area{t}.roundpath                =   nextrounds(k).shpbufferpathfolder; 
                               KonwnObject.Area{t}.privousshpsbuffer        =   nextrounds(k).privousshpsbuffer;  
                               t                                            =   t+1;
                               
                           end
                       end
                      break;  
                    end
             end
               
        end
            if(numel(KonwnObject)> 0)
                for i= 1:numel(KonwnObject.Area)
                   polyshpsbuffer                                                   = KonwnObject.Area{i}.polyshpsbuffer;
                   wholetrain                                                       = KonwnObject.Area{i}.wholetrain;
                   wholetest                                                       = KonwnObject.Area{i}.wholetest;
                   FeaturesObject                                                   = KonwnObject.Area{i}.method.FeaturesObject;

                   newDataSet                                                       = GetNewData(FeaturesObject,polyshpsbuffer,wholetrain,wholetest);
                   KonwnObject.Area{i}.method.FeaturesObject                        = newDataSet;
    %                shapewrite(polyshpsbuffer,'I:\polyshpsbuffer.shp');
    %                shapewrite(newDataSet,'I:\newDataSet.shp');

                end
            end
            
           
      
