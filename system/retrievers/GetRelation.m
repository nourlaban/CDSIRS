function reals = GetRelation(tiles,reals)
         s = size(tiles);
         t = size( reals);
         for i = 1:t(2)
             neartile =  {};
             k = 1;
             for j = 1:s(2)
                 realtile =  reals{i};
                 cutertile = tiles{j};
                 percent = intertile( realtile , cutertile);
                 if(percent > 0);
                     neartile{k}.tile = cutertile;
                     neartile{k}.percent = percent;
                     k = k +1;
                 end         
             end
             reals{i}.neartile = neartile;    
         end
   

function percent = intertile(realtile , cutertile)
        p1r = realtile.rect(1);
        p2r = realtile.rect(3);
        q1r = cutertile.rect(1);
        q2r = cutertile.rect(3);

        p1c = realtile.rect(2);
        p2c = realtile.rect(4);
        q1c = cutertile.rect(2);
        q2c = cutertile.rect(4);

        f1r = position(p1r,  q1r , q2r);
        f2r = position(p2r,  q1r , q2r);
        fr = f1r + f2r;
        f1c = position(p1c,  q1c , q2c);
        f2c = position(p2c,  q1c , q2c);
        fc = f1c + f2c;

        s1 = 0;
        s2 = 0;
        if(abs( fr) < 2   &&  abs( fc ) < 2)             
                
                sr = max(p1r,q1r);
                er = min(p2r,q2r);
                s1 = er-sr+1;
                
                sc = max(p1c,q1c);
                ec = min(p2c,q2c);
                s2 = ec-sc+1;               
                
        end

        area = (p2r - p1r) * (p2c - p1c);
        percent = ( double(s1*s2) / double(area))* 100 ;




function f = position(n,  m1 , m2)

        if(n <  m1     ) 
            f = -1;
            return ;
        end

        if(n >=    m1  && n <=  m2    ) 
            f = 0;
             return ;
        end

        if(n >  m2 )
            f= 1;
             return ;
        end


