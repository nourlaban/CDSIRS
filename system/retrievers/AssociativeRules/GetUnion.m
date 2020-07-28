function c = GetUnion(A,B) 
       if(isempty(B) )
            c = A;
       else
                
            [x,y]    =   polybool('union',  A.X, A.Y,B.X,B.Y);                               

            x1 = min(x);
            x2 = max(x);
            y1 = min(y);
            y2 = max(y);               

            c.Geometry      =  'Polygon';
            c.BoundingBox   = [x1,y1;x2,y2];
            c.X             = x;
            c.Y             = y;
            c.Id            = 0;
        end
                
      