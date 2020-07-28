function CX = reformulate(C,b)
             CX = {}; t = 1;             
             for i = 1:numel(C)
                 if(b), x = C(i).X;else x= C(i).Y;end
                 d = [];
                     for j = 1 : numel(x)

                         if(isnan(x(j)))
                             CX{t}  =  d;
                             t      =   t +1;
                             d      =   [];
                         else          
                             d      =   [d,x(j)];
                         end

                     end
             end
       