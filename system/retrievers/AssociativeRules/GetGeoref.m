function shapefile = GetGeoref(a)
        r1 =a(2);
        c1 =a(3);
        r2 =a(4);
        c2 =a(5);

        x1 = r1 ; y1 = c1 ; x2 = r2 ; y2 = c2 ;
        
        BoundingBox = [x1 y1;x2 y2];
        X           = [x1 x1 x2  x2   x1 NaN];
        Y           = [y1 y2 y2  y1   y1 NaN];


        shapefile.Geometry      = 'Polygon'; 
        shapefile.BoundingBox   = BoundingBox;
        shapefile.X             = X;
        shapefile.Y             = Y;
        shapefile.Id            = a(1);
        shapefile.distance      = a(6);

