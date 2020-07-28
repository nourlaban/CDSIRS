function q = quantize2D(matrix,BinsNum)

maxv = max( max(matrix));
minv = min( min(matrix));
range = maxv - minv ;
step = range / BinsNum ;

q = [];

for i = 1:BinsNum
    l = minv +( step * (i-1) );
    u = minv +( step * i );
    limits{i}.ul = [l u ];   
end
 q =  lacalpara(matrix,limits);


function  q =  lacalpara(matrix,limits);
   s =  size(matrix);
   lm = size(limits);
   for k = 1: lm(2)
       limits{k}.LacalVec  = [];
   end
   
   
   for i = 1:s(1);
       for j = 1:s(2)
           for k = 1:lm(2)
              ul = limits{k}.ul;
              if(matrix(i,j) >= ul(1) & matrix(i,j)< ul(2))
                 limits{k}.LacalVec = [limits{k}.LacalVec , matrix(i,j) ];
              end 
           end
       end
   end
   q = [];
   for k = 1:lm(2)
           c = size(limits{k}.LacalVec);
           if(c(1) > 0 )       
               m = int16(mean(double(limits{k}.LacalVec)));
               s = int16(std(double(limits{k}.LacalVec )));
           else
               m = 0;
               v = 0;
           end
           q = [q m s];  
   end
   
   
  
   