function RetrieverManger(work,Duties,CurrentDuties,retreive)
            clc;
           
            AreaObjects         =   getSemanticArea(work.TrainTestPath.Area,Duties,CurrentDuties);            
            channels            =   retrieveHierachy(work,AreaObjects);
            FeaturesObjects     =   RetrieveObjects(channels);                     
            index               =   SortAreas(FeaturesObjects,AreaObjects);
            
            TXP                 = CurrentDuties.TXP;           
            for j = 1:numel(TXP)
                    Xpercent            = Duties.TrainXpercent{TXP(j)};                    
                   [KnownObjects index] = GetALLIntersections(AreaObjects,FeaturesObjects,...
                                                                   Xpercent,retreive.XTrain,index); 
                    nextstage           = [];  
                    stage               = '\stage1';
                    nextstage           = retrieveround(work,Duties,CurrentDuties,...
                                                                   retreive,KnownObjects,Xpercent,nextstage,stage);
                    KonwnObject         = whoiswho(FeaturesObjects,AreaObjects,nextstage,index);
                    if(~isempty(KonwnObject))
                        stage               = '\stage2';
                        nextstage           = retrieveround(work,Duties,CurrentDuties,...
                                                                   retreive,KonwnObject,Xpercent,nextstage,stage);
                    end
            end
            
  
      
              
    function nextstage = retrieveround(work,Duties,CurrentDuties,retreive,KnownObjects,Xpercent,nextstage,stage)
            DefaultPath         = cd; 
            RE                  = CurrentDuties.RE;     
            for i = 1:numel(RE)             
                   engine = Duties.RetrieverEngine{ RE(i)};                   
                   cd([DefaultPath,'\',engine]);                          
                   nextstage =  retriever(work,CurrentDuties,engine,KnownObjects,retreive,Xpercent,nextstage,stage);                    
                   cd(DefaultPath);
            end
         

       
       
       
       
       
       