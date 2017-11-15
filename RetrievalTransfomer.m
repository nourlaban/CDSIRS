function RetrievalTransfomer (stages,experiment,CurrentDuties,retreive)
         warning off all ;
         clc;
         [pathes Duties]     = setParametrs();         
         work                = getpaths(experiment);
        
         defaultdirectory    = cd; 
        if(stages(1))
            cd([defaultdirectory,work.subcodepath,'\extractors']);
            ExtractorForRetrieval(pathes,work ,Duties,CurrentDuties)
           
        end
        
        if(stages(2))
            cd([defaultdirectory, work.subcodepath ,'\retrievers']);
            RetrieverManger(work,Duties,CurrentDuties);
        end
       

        cd(defaultdirectory);       