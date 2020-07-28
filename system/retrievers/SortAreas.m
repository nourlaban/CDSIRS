function Order = SortAreas(FeaturesObjects,AreaObjects) 
        area = [];
        for j = 1:numel(FeaturesObjects)
               b = FeaturesObjects{j};
               tilesize  = b.tilesize(3:end-1);
               s = findstr( tilesize,' ');
               x = str2double(tilesize(1:s(1)-1));
               y = str2double(tilesize(s(1)+1 : end));
               area = [area;x*y ];
               
        end
        [c.sortedarea, c.index ] = sortrows(area);
        index = c.index; 
        a(1:numel(AreaObjects)) = -1;
        
        
        Order = [];
        for i=numel(index):-1: 1
           Order = [Order;index(i),a];  
        end      
      