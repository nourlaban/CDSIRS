function shpinf =  calcArea(shp)
        area = 0;
        for i =1 : numel(shp)
            x = shp(i).X;
            y = shp(i).Y;
            
            xa =  avoidnan(x);
            ya =  avoidnan(y);
            
            if(numel(xa) ==  1 )
                xn =  xa{1};
                yn =  ya{1};
                a = polyarea(xn,yn);
                shp(i).area = a;
                area = a;
            elseif(numel(xa) >  1)
                xn =  xa{1};
                yn =  ya{1};
                a = polyarea(xn,yn);
                b = 0;
                for j = 2:numel(xa)
                    xn =  xa{j};
                    yn =  ya{j};
                    b  =  b + polyarea(xn,yn);
                end
                a = a - b;
                shp(i).area = a;
                area = area + a;
            end
           
        end
        
        shpinf.shp  =   shp;
        shpinf.area =  area ;
        
        
        
     
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
        
        
        