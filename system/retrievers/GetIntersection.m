function [C Carea]= GetIntersection(A,B) 
                 AX = reformulate(A,1)   ;                
                 AY = reformulate(A,0)   ;
                 a = newinpolygon(AX,AY,B.X,B.Y);
                 C      = [];
                 Carea  = 0;
                 if(a) 
                     [x,y]    =   polybool('intersection',  AX, AY,B.X,B.Y);                               

                  
                         for k = 1:numel(x)
                            x1 = min(x{k});
                            x2 = max(x{k});
                            y1 = min(y{k});
                            y2 = max(y{k});               

                            c.Geometry      =  'Polygon';
                            c.BoundingBox   = [x1,y1;x2,y2];
                            c.X             = x{k};
                            c.Y             = y{k};
                            c.Id            = 0;                    
                            C               = [C ; c] ;
                         end
                          C                  = calcArea(C);
                           for i = 1 : numel(C)
                                Carea          = Carea + C(i).area;
                            end
                  end
                 
                
                 
                
                 
          
                 
                     
                     
    
       
             
             
             
             
             
       
                 
                   