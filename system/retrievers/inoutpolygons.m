function a = inoutpolygons(A,B)
                    a = 0;    
                    mn = 0;
                    mo = 0;                 
        
                     for i = 1:numel(B)
                         nanpos = [];
                         for j = 1:numel( B(i).X)
                              if(  isnan( B(i).X(j) ))
                                  nanpos = [nanpos,j];
                              end
                         end
                         
                         AX = A.X(1:end-1);
                         AY = A.Y(1:end-1);
                         BX = B(i).X(1:nanpos(1)-1);
                         BY = B(i).Y(1:nanpos(1)-1);
                         
                         N =  inpolygon(AX,AY ,BX,BY);
                         
                         if(mean(N) == 1)
                            mn = mn +1;                       
                         end
                       
                         if(numel(nanpos)> 1)
                            for j = 2:numel(nanpos)                              
                                
                                 BX = B(i).X(nanpos(j-1)+1:nanpos(j)-1);
                                 BY = B(i).Y(nanpos(j-1)+1:nanpos(j)-1);

                                 N =  inpolygon(AX,AY ,BX,BY);                                
                               
                                 if(mean(N) > mo)
                                    mo = mean(N);                       
                                end
                            end                        
                         end
                         
                         
                     end
                     
                     
                    if( (mn  == 1 && mo  < 1) ||( mn  == 2  && mo == 1  )   )
                           a = 1;              
                    end  
                     
                     
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    
                    