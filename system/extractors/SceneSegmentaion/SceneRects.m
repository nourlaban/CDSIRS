function tiles  = SceneRects(dimWH , scenesize )

rows            = scenesize(1);
cols            = scenesize(2);
imagesize       = dimWH;
imagerows       = imagesize(1);
imagecolumns    = imagesize(2);
colhstep        = floor(imagecolumns);
rowtstep        = floor(imagerows);


k       =   1;  
tiles   =   {};


  i = 1  ;  
   while i <=  cols
       j = 1 ;
       ec = 0;
            while j <= rows
                 er  = 0;
                 c1 = i ;
                 r1 = j ;
                    
                    if(i + colhstep >= cols )
                       c1 = cols - colhstep;
                       ec = 1;
                    end
                    
                    if(j + rowtstep >= rows )
                      r1 = rows - rowtstep;
                      er = 1;
                    end
                    
      
                    tiles{k}. rect= [r1 c1 r1+rowtstep  c1+colhstep];
                    tiles{k}.imagesize = imagesize;                    
                    k=k+1;              
                
               
                    
                if er == 0
                    j = j + rowtstep;
                else
                    j = j + ( 2 * rowtstep);
                end
                
            end
            
            if ec == 0
                i = i + colhstep;
            else
                i = i + ( 2 * colhstep); 
            end

   end
   
   
    
  
   
   