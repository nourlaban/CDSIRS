function scene = GetRectRef(scene)
                 C = [];
               for i =1:numel(scene.datafeatures)
                     rect       =   scene.datafeatures{i}.rect;
                      x1   =   rect(1);y1 = rect(2);
                      x2   =   rect(3);y2 = rect(4);
                    
                     
                     box = [x1 y1;x2 y2]; 
                     
                     x = [box(1,1),box(2,1),box(2,1),box(1,1),box(1,1)];
                     y = [box(1,2),box(1,2),box(2,2),box(2,2),box(1,2)];   
                     c.Geometry =  'Polygon';
                     c.BoundingBox = box;
                     c.X = x;
                     c.Y = y;
                     c.Id= 0;
                     scene.datafeatures{i}.shape = c;
                     
                     C = [C;c];
               end
               scene.rectshape = C;
             
