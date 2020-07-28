function polyshps = GetGolbalIntersection(A,B) 
                 AX = [];AY = [];
                 for i = 1:numel(A)
                 AX = [AX,NaN,A(i).X];
                 AY = [AY,NaN,A(i).Y];
                 end
                 
                 BX = [];BY = [];
                 for i = 1:numel(B)
                 BX = [BX,NaN,B(i).X];
                 BY = [BY,NaN,B(i).Y];
                 end
                 
                 [x,y]    = polybool('intersection',  AX, AY,BX, BY);
                 
                    x1 = min(x);
                    x2 = max(x);
                    y1 = min(y);
                    y2 = max(y);               
                     
                    c.Geometry      =  'Polygon';
                    c.BoundingBox   = [x1,y1;x2,y2];
                    c.X             = x;
                    c.Y             = y;
                    c.Id            = 0; 
                    polyshps = reformulateSHPfile(c);
                    if(isempty(polyshps))
                        a = 1;
                    end
                    
                    
          function polyshps = reformulateSHPfile(shapefile)
                
                 
                [X Y]= polysplit(shapefile.X,shapefile.Y);
                if(~isempty(X))
                        P(numel(X)) = 0;
                        if(numel(X) > 1)                   
                            for i = 1:numel(X)
                                for j = 1:numel(X)
                                 if(P(j) == 0 && i ~= j) 
                                          IN  = inpolygon(X{j},Y{j},X{i},Y{i});
                                          if( mean(IN) == 1 )
                                             P(j) = i;                        
                                          end  
                                 end

                                end
                            end

                        end

                        polyshps = [];
                        for i = 1:numel(P)
                            if(P(i)== 0)

                                CX = X{i};
                                CY = Y{i};
                                x1 = min(CX);
                                y1 = min(CY);
                                x2 = max(CX);
                                y2 = max(CY);

                                c.Geometry      =  'Polygon';
                                c.BoundingBox   = [x1,y1;x2,y2];
                                c.X             = [CX,NaN];
                                c.Y             = [CY,NaN];
                                c.Id            = 0;



                                for j = 1:numel(P)
                                    if(P(j)== i)
                                        c.X             = [c.X,X{j},NaN];
                                        c.Y             = [c.Y,Y{j},NaN];
                                    end

                                end
                                polyshps        = [polyshps;c];

                            end
                        end  
                else
                    polyshps = [];
                 
                end
                    
                    

                 
                 
                 
    
                       
            
             
             
             
             
             
             
             
             
             
             
             
             
