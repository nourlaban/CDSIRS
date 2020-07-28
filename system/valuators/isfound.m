 function neartiles = isfound(FileName,neartiles,resultObject)
         s = size(neartiles);
         for j = 1:s(2)
           rect = neartiles{j}.tile.rect; 
           found  =  relativefound(FileName,rect',resultObject);
           neartiles{j}.found = found;   
         end
       
  
  
  
     function found  =  relativefound(FileName,rect,resultObject) 
             found = 0;
             r = size(resultObject);             
             for i = 1:r(2)
                FileName1  =  resultObject{i}.FileName;
                FileName2  = FileName;
                f = strcmp(FileName1,FileName2);                             
                if(f)
                    rate =  resultObject{i}.Rate;
                    if (  rect (1) == rate(2)  &&  rect (2) == rate(3)  && rect (3) == rate(4)  && rect (4) == rate(5)  )                        
                       found = 1;
                    end  
                end
             end
           
          
             
        
             
             
             
             
             
             
             
             
    