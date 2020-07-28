function polyshps = reformulateSHPfile(shapefile)
                
                 
                [X Y]= polysplit(shapefile.X,shapefile.Y);
                P = [];
                if(numel(X) > 1)
                    P(numel(X)) = 0;
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
                                    P(j)            = -1;
                                end

                            end
                            
                            
                            polyshps        = [polyshps;c];

                        end
                    end   
                    
                    for j = 1:numel(P)
                        if(P(j) ~= -1 && P(j) ~= 0)
                            CX = X{j};
                            CY = Y{j};
                            x1 = min(CX);
                            y1 = min(CY);
                            x2 = max(CX);
                            y2 = max(CY);

                            c.Geometry      =  'Polygon';
                            c.BoundingBox   = [x1,y1;x2,y2];
                            c.X             = [CX,NaN];
                            c.Y             = [CY,NaN];
                            c.Id            = 0;
                            
                           polyshps        = [polyshps;c];
                        end

                    end
                    
                    
                    
                    
                    
               
            