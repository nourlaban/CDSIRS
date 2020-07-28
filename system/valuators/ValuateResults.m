function retrievalsobject = ValuateResults(retrievalsobject)

for i = 1:numel(retrievalsobject) 
    for j = 1:numel(retrievalsobject{i}.stages) 
   for q = 1:numel(retrievalsobject{i}.stages{j}.methods)      
               for k =1:numel(retrievalsobject{i}.stages{j}.methods{q}.engines) 
                   for h = 1:numel(retrievalsobject{i}.stages{j}.methods{q}.engines{k}.overlapobject)
                   
                      fullretrivalpath          = retrievalsobject{i}.stages{j}.methods{q}.engines{k}.overlapobject{h}. fullretrivalpath;
                      testpath                  = retrievalsobject{i}.stages{j}.methods{q}.engines{k}.overlapobject{h}.testpath;
                      results                   = {};
                      shpfiles                  = dir([fullretrivalpath,'\k*.shp']);
                       num = [];
                      for u = 1:numel(shpfiles)
                         num = [num; str2double( shpfiles(u).name(3:end-5))];
                      end
                      num =  sortrows(num);
                      
                      for u = 1:numel(num)
                          testshp              = shaperead(  testpath );
                          resultshp            = shaperead([fullretrivalpath,'\k_',num2str(num(u)),'%.shp']); 

                          intersectionshp      = GetGolbalIntersection(testshp,resultshp);                          
                         
                          a                    = shpareacalc(testshp);
                          b                    = shpareacalc(resultshp);
                          c                    = shpareacalc(intersectionshp);

                          results{u}.recall    = (c/a)*100;
                          results{u}.precision = (c/b)*100; 
                          results{u}.name      = num2str(num(u));

                      end


                      retrievalsobject{i}.stages{j}.methods{q}.engines{k}.overlapobject{h}.results =   results;
                   
                   end
                  
               end
   end
   end
end


    function actualarea =  shpareacalc(shp)
        actualarea  =0;
        for i =1 : numel(shp)
            x = shp(i).X;
            y = shp(i).Y;
            
            xa =  avoidnan(x);
            ya =  avoidnan(y);
            actualarea = actualarea + inout(xa,ya);
%             if(numel(xa) ==  1 )
%                 xn =  xa{1};
%                 yn =  ya{1};
%                 a = polyarea(xn,yn);
%             elseif(numel(xa) >  1)
%                 ins = inout(xa,ya);
%                 
%                 xn =  xa{1};
%                 yn =  ya{1};
%                 a = polyarea(xn,yn);
%                 b = 0;
%                 for j = 2:numel(xa)
%                     xn =  xa{j};
%                     yn =  ya{j};
%                     b = b+ polyarea(xn,yn);
%                 end
%                 a = a - b;
%                 
%             end
%             aa = aa +a;
        end
        
        function actualarea = inout(xa,ya)  
             actualarea = 0;
             for i = 1:numel(xa)
                X1 = xa{i}; Y1 = ya{i}; a = polyarea(X1,Y1);
                c = 0;
                for j = 1:numel(xa)
                    if(i ~= j)                        
                        X2 = xa{j}; Y2 = ya{j};
                        in  = inpolygon(X1,Y1,X2,Y2);
                        if(in);c=1 ;end
                    end                  
                end
                if(c);a = a * -1;end
                actualarea =  actualarea + a;
            end
        
        
        
        function za =  avoidnan(z)
            za  = {};
            m   = [];
            k   = 1;
            for j = 1: numel(z)
                if ( isnan(z(j)) )
                    za{k}   = m;
                    k       = k+1;
                    m       = [];
                elseif ( j == numel(z) )
                    m       = [m,z(j)]; 
                    za{k}   = m;
                    k       = k+1;
                    m       = [];                    
                else
                    m       = [m,z(j)];
                end
            end
           


    
       