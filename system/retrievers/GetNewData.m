function  newDataSet  = GetNewData(FeaturesObject,polyshpsbuffer,wholetrain,wholetest)
             newDataSet = [];
              tr = 0;
             for j = 1:numel(FeaturesObject)
                 clc;j
                     A  =  FeaturesObject(j);                  
                     at  = inoutpolygons(A,polyshpsbuffer);
                     bt  = inoutpolygons(A,wholetrain);
                     ct  = inoutpolygons(A,wholetest);
                    if(mean(at)~= 0  && mean(bt)== 0)
                        A.train = 0;
                        if( mean(ct)== 1)
                            A.test      = 1;
                        else
                             A.test     = 0;
                        end
                        newDataSet = [newDataSet;A] ;
                    end
                    
                    if( mean(bt)== 1)
                        A.train     = 1;
                        A.test      = 0;
                        newDataSet  = [newDataSet;A] ;
                        tr          = tr +  1;
                    end
                    
                    
              end
            
          
  