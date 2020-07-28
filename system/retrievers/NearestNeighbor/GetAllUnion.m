function C = GetAllUnion(A,B)        
            for i = 1: numel(A)                
                for j = 1:numel(B) 
                    if(j > numel(B)),break;end
                    N =  inpolygon(A(i).X, A(i).Y,B(j).X,B(j).Y);
                    M =  inpolygon(B(j).X,B(j).Y,A(i).X, A(i).Y);
                    
                    if(mean(N)> 0 || mean(M) > 0 )
                        [x,y]       = polybool('union',  A(i).X, A(i).Y,B(j).X,B(j).Y);
                        x1          = min(x);
                        x2          = max(x);
                        y1          = min(y);
                        y2          = max(y);               

                        c.Geometry      = 'Polygon';
                        c.BoundingBox   = [x1,y1;x2,y2];
                        c.X             = x;
                        c.Y             = y;
                        c.Id            = 0;
                        A(i)            = c;
                        B(j)            = [];
                        j               = j -1;
                        
                    end
                end
            end
             
            A = [A,B];
            C = [];

            B = A;
            i =1 ; 
            num = numel(A);
            while i <= num               
                [AN  B changed ]  = joinN(A(i),B);
                if changed 
                    C  = [C AN];   
                    A   = B;               
                    i   = 1;
                    num = numel(A);
                
                else                   
                    i = i + 1;
                end
                
             end
            
%            C               = [C ,B];             
            
    function [AN  B changed ]= joinN(AN,B )
          changed  = 0; 
          j =1 ;
           while j <= numel(B)
                    N =  inpolygon(AN.X, AN.Y,B(j).X,B(j).Y);
                    M =  inpolygon(B(j).X,B(j).Y,AN.X, AN.Y);

                    if( mean(N) > 0 || mean(M) > 0 )
                        [x,y]       = polybool('union',  AN.X, AN.Y,B(j).X,B(j).Y);
                        x1          = min(x);
                        x2          = max(x);
                        y1          = min(y);
                        y2          = max(y);

                        c.Geometry      = 'Polygon';
                        c.BoundingBox   = [x1,y1;x2,y2];
                        c.X             = x;
                        c.Y             = y;
                        c.Id            = 0;
                        AN              = c;                    
                        B(j)            = [];
                        changed         = 1;
                    else
                        j = j + 1;
                    end
             
           end
            
      
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           
           