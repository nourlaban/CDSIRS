function C = GetIntersection(A,B)                
                 AX = {}; for k = 1:numel(A), AX{k} = A(k).X ;AX{k}(isnan(AX{k})) = []; end ;
                 AY = {}; for k = 1:numel(A), AY{k} = A(k).Y ;AY{k}(isnan(AY{k})) = []; end ;
                 BX = {}; for k = 1:numel(B), BX{k} = B(k).X ;BX{k}(isnan(BX{k})) = []; end ;
                 BY = {}; for k = 1:numel(B), BY{k} = B(k).Y ;BY{k}(isnan(BY{k})) = []; end ;
                 
                 [x,y]    =   polybool('intersection',  AX, AY,BX,BY);                               
                 
                 C = [];
                 for k = 1:numel(x)
                    x1 = min(x{k});
                    x2 = max(x{k});
                    y1 = min(y{k});
                    y2 = max(y{k});               
                     
                    c.Geometry =  'Polygon';
                    c.BoundingBox = [x1,y1;x2,y2];
                    c.X = x{k};
                    c.Y = y{k};
                    c.Id= 0;
                    C = [C ; c] ;
                 end
