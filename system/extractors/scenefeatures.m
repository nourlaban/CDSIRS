function Shpfeatures  =  scenefeatures(work ,scenename ,parameters,SZ)
        work.FullPath                   = [work.DataPath,'\',scenename]; 
        [scene, Ref, bbox]              = geotiffread(work.FullPath);      
        tiles                           = SceneRects(SZ,bbox);      
        Shpfeatures       = writetiles(scene,tiles,parameters,Ref);
        
        
        
    function  Shpfeatures = writetiles(scene,tiles,parameters,Ref)        
              s = size(scene);
              z = size(tiles);
              Shpfeatures = [];
              
              
                for p = 1: z(2)
                   

                      rect =  tiles{p}.rect;

                      [r1,c1] = map2pix(Ref, rect(1), rect(2));
                      [r2,c2] = map2pix(Ref, rect(3), rect(4));
                      if r1 < 1 ,r1=1;end ;if r2 < 1 ,r2=1;end ;if c1 < 1 ,c1=1;end;if c2 < 1 ,c2=1;end
                      if r1 > s(1) ,r1=s(1);end ;  if r2 > s(1) , r2=s(1); end ;if c1 > s(2) ,c1=s(2);end;if c2 > s(2) ,c2=s(2);end
                      matrices          =  scene( r2 : r1  ,  c1 : c2,: );    
                      
                           box              = [rect(1) rect(2);rect(3) rect(4)]; 
                           x                = [box(1,1),box(2,1),box(2,1),box(1,1),box(1,1)];
                           y                = [box(1,2),box(1,2),box(2,2),box(2,2),box(1,2)];   
                           
                           c.Geometry       = 'Polygon';
                           c.BoundingBox    = box;
                           c.X              = x;
                           c.Y              = y;
                           c.Id             = 0;
                           c.area           = polyarea(x,y);
                      
                      for  i = 1:numel(parameters)
                          FileParameters                    = parameters{i};
                          featurevector                     = getFeatureVector(matrices,FileParameters); 
                          c.(FileParameters.StateCode)       = mat2str(featurevector);                         
                      end                   
                      Shpfeatures                           = [Shpfeatures;c];
                end

        
        
                   
                
                
                
                
                
                
                
                
                
                
                
                
 