function [testshp     resultshp  ]     =  evaluate(testshp,resultshp)      
       for i = 1:numel(testshp) 
            for j = 1:numel(resultshp)       
                C = GetIntersection(testshp(i),resultshp(j));
                if(~isempty(C))   
                    testshp(i).Id       = j;    
                    resultshp(j).Id     = 1;                     
                end       
            end
        end










     
      