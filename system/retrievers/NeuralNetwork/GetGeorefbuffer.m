function shapefile = GetGeorefbuffer(a,p)
        r1 =a(2);
        c1 =a(3);
        r2 =a(4);
        c2 =a(5);
        
         d =   floor ( (r2 - r1) * p );
       
         
         

        x1 = r1 - d ; y1 = c1-d ;
        x2 = r2+d   ; y2 = c2+d ;
        
        BoundingBox = [x1 y1;x2 y2];
        X           = [x1 x1 x2  x2   x1 NaN];
        Y           = [y1 y2 y2  y1   y1 NaN];


        shapefile.Geometry      = 'Polygon'; 
        shapefile.BoundingBox   = BoundingBox;
        shapefile.X             = X;
        shapefile.Y             = Y;
        shapefile.Id            = 0;
       