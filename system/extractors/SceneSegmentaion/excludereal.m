function tiles = excludereal(realinfo,tiles,type)

    s = size(tiles);
    for i =1: s(2)
     tiles{i}.del = 0;
    end

    s = size(realinfo);
    for i=1:s(2)
        realfileinfo =  realinfo{i};
        if (type == 1)
                real =  realfileinfo.train;      
        else
                real =  realfileinfo.test;  
        end
            
        t = size(real);
        for j = 1: t(2)
            creal =  real{j};
            neartile = creal.neartile;
            z = size(neartile);
            for k = 1:z(2)
                tiles = pointtodel(tiles,creal.neartile{k}.index);
            end
         end        

    end


    s   = size(tiles);
    ls  = s(2);
    i   = 1;

    while i <= ls         
          if (tiles{i}.del == 1 && i <= ls)
              tiles = delcell(tiles,i);
              ls  = ls - 1;
              i = i - 1;             
          end
          i = i+1;
    end
    
    
    
    
    
    
    

