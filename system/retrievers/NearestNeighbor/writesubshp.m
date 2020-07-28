function nextstage = writesubshp(fullpath,SortedArray,retreive,nextstage,super,roundpath,privousshpsbuffer)
        
        shapefile           = []; 
        shapefilebuffer     = [];
        
        if(isempty(roundpath))
            step = retreive.step ; kpercent = retreive.k ;
        else 
            step = retreive.roundstep ; kpercent =  retreive.roundk ;
        end   
        
        for j = step:step:kpercent
                shp                         = [fullpath,'\k_',num2str(abs (j * 100 ) ),'%.shp'];
                shpbuffer                   = [fullpath,'\buffer\b_',num2str(abs (j * 100 ) ),'%.shp'];              
                super.shpbufferpath         = shpbuffer;
                super.shpbufferpathfolder   = ['_',num2str(abs (j * 100 ) ),'%'];
                super.percent               = j;
              
                
                s                           = size(SortedArray);           
                n                           = floor( j * s(1));
                start                       = n - floor( step * s(1))     +   1;

                       
                for  i = start:n
                     a                  = SortedArray(i,:)          ;                     
                     shpref             = GetGeoref(a)  ;
                     shprefbuffer       = GetGeorefbuffer(a,1);                     
                     shapefile          = GetUnion(shpref,shapefile)   ; 
                     shapefilebuffer    = GetUnion(shprefbuffer,shapefilebuffer)   ;
                end 
                
                
                buffer                  = Getsubtraction(shapefilebuffer,shapefile) ;
                
                
                polyshps                = reformulateSHPfile(shapefile)';
                polyshpsbuffer          = reformulateSHPfile(buffer)';
                super.privousshpsbuffer = polyshps;
                super.polyshpsbuffer    = polyshpsbuffer;
              
                
                polyshps                = GetAllUnion(polyshps,privousshpsbuffer)';
               
                nextstage               = [nextstage;super];
                
                if(~isempty(polyshps))
                    shapewrite(polyshps,shp);
                end
                
                if(~isempty(polyshpsbuffer))
                    shapewrite(polyshpsbuffer,shpbuffer);
                end
         end
        
          
  