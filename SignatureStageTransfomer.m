function SignatureStageTransfomer( stages,experiment,CurrentDuties,retreive)
         warning off all ;
         clc;
         [pathes Duties]     = setParametrs();         
         work                = getpaths(experiment);
        
         defaultdirectory    = cd; 
        if(stages(1))
            cd([defaultdirectory,work.subcodepath,'\extractors']);
            ExtractorManger(pathes,work,Duties,CurrentDuties);
        end
   
        cd(defaultdirectory);       