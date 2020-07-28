function WriteResults(work,name,samearray,Featuresmethod,k)
        datarects   = samearray.datarects;
        s           = size(datarects);
        SortedArray =  sortrows(datarects, s(2) );
        fullpath    = [work.WorkPath,work.subworkpath,work.retrievals,name.area,'\',name.method,'\',name.engine ];
        
        mkdir(fullpath);
        
        s           = size(SortedArray);
        trainshp    = [fullpath,'\train.shp'];
        testshp     = [fullpath,'\test.shp'];
        wholeshp    = [fullpath,'\whole.shp'];
                
         shp            = [fullpath,'\k_',num2str(k),'.shp'];
         shapefile      = [];
         n              = abs( k * s);
         
         for  i = 1:n
            a           = SortedArray(i,:);
            shapefile   = GetGeoref(a,shapefile,i);
         end
         
         shapefile  = shapefile';
         shapewrite(shapefile,shp);   
        
         shapewrite(Featuresmethod.RXShape,trainshp);
         shapewrite(Featuresmethod.SXShape,testshp);
         shapewrite(Featuresmethod.FeaturesObject,wholeshp);
 



function shapefile = GetGeoref(a,shapefile,i)
        r1 =a(1);
        c1 =a(2);
        r2 =a(3);
        c2 =a(4);

         x1 = r1 ; y1 = c1 ; x2 = r2 ; y2 = c2 ;


        BoundingBox = [x1 y1;x2 y2];
        X = [x1 x1 x2  x2   x1 NaN];
        Y = [y1 y2 y2  y1   y1 NaN];


        shapefile(i).Geometry      = 'Polygon'; 
        shapefile(i).BoundingBox   = BoundingBox;
        shapefile(i).X             = X;
        shapefile(i).Y             = Y;
        shapefile(i).Id            = 0;
         shapefile(i).distance      = a(5);







