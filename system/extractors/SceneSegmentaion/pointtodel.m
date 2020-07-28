function tiles = pointtodel(tiles,index)
        s = size(tiles);
        for i = 1 : s(2)

          if (index == i)
            tiles{i}.del = 1;       
          end

        end