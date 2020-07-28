function a = newinpolygon2(A,B)
                     a = 0;                 
                     [IN OUT]= inoutpolygons(B);
                     mn = 0;
                     mo = 0;
                     for i = 1:numel(IN)     
                         N =  inpolygon(A.X(1:end-1),A.Y(1:end-1),IN(i).X,IN(i).Y);
                         if(mean(N) > mn)
                            mn = mean(N);                       
                         end
                     end
                     
                     for i = 1:numel(OUT)     
                         N =  inpolygon(A.X(1:end-1),A.Y(1:end-1),OUT(i).X,OUT(i).Y);
                         if(mean(N) > mo)
                            mo = mean(N);                       
                         end
                     end
                     
                     if( mn  == 1 && mo  < 1 )
                           a = 1;              
                     end


   
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     
                     