function OrderTransfomer( stages,CurrentDuties,retreive)
         warning off all ;
         clc;
         [pathes Duties]     = setParametrs();         
         work                = getpaths();
        
         defaultdirectory    = cd; 
        if(stages(1))
            cd([defaultdirectory,work.subcodepath,'\extractors']);
            ExtractorManger(pathes,work,Duties,CurrentDuties);
        end
        
         if(stages(2))
            cd([defaultdirectory,work.subcodepath,'\fsigners']);
            SignerManger(work,Duties,CurrentDuties,retreive)
         end
  
        if(stages(3))
            cd([defaultdirectory, work.subcodepath ,'\retrievers']);
            RetrieverManger(work,Duties,CurrentDuties,retreive);
        end
  
        if(stages(4))
            cd([defaultdirectory, work.subcodepath,'\valuators']);
            ValuatorManger(work);
        end

        cd(defaultdirectory);       