function [AMS methodsnumber ] = getcurrent(FeaturesObjects,CurrentDuties)
    CMCS              =   CurrentDuties.CMCS;
    CMES              =   CurrentDuties.CMES;
    
  
   if(numel(CMCS)> 0 && numel(CMES)> 0 ) 
       AMS = getmethods(CMCS,CMES);
       methodsnumber = numel(AMS);
   else
       methodsnumber = numel(FeaturesObjects.method.methods);
       AMS           = 1: numel(FeaturesObjects.method.methods);
   end
           
           
           
function AMS = getmethods(A,B)
           AMS = [];
          
           for a = 1: numel(A)
               for b = 1: numel(B)
                   AMS  = [AMS,A(a)*B(b) ];
               end
           end



