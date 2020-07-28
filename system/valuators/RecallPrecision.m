 function results = RecallPrecision(testshp,resultshp)
       results      = {};
       p            = 1;
       percent      = .2;
       step         = floor( numel (resultshp) * percent );
       
       for i = step :step: numel (resultshp)        
          
            if (numel (resultshp)- i < step ), i = numel (resultshp) ;end 
            
            [recall precision newresshape ]      = RecallPrecision1(testshp,resultshp,i);
            results{p}.recall                   = recall;
            results{p}.precision                = precision; 
            results{p}.number                   = i;
            results{p}.newresshape              = newresshape;           
            p                                   = p+1;
            
       end
       
 
        
       
                          
          
      function [recall precision  newresshape ]= RecallPrecision1(testshp,resultshp,total)
       
        r = 0;
        for i = 1:numel(testshp)
            if (testshp(i).Id <= total && testshp(i).Id > 0 )
                r = r +1;
            end
        end
        recall = (  double (r) /numel(testshp) )*  100 ;
        
        
        newresshape = [];
        p = 0;
        for j = 1:total
            if(resultshp(j).Id)
                p = p+1;
            end
           
            newresshape= [newresshape ; resultshp(j)];
        end
          
        precision = (double(p) /total) * 100;
         
       
         
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          
          