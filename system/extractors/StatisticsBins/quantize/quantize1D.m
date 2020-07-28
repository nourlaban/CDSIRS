function q = quantize1D(Vector,BinsNum)

maxv = max(Vector);
minv = min(Vector);
range = maxv - minv ;
step = range / BinsNum ;

q = [];

for i = 1:BinsNum
    l = minv +( step * (i-1) );
    u = minv +( step * i );
    limits{i}.ul = [l u ];   
end
 q =  lacalpara(Vector,limits);


function  q =  lacalpara(Vector,limits);
   s =  size(Vector);
   lm = size(limits);
   for k = 1: lm(2)
       limits{k}.LacalVec  = [];
   end   
   
   for i = 1:s(1);      
           for k = 1:lm(2)
              ul = limits{k}.ul;
              if(Vector(i) >= ul(1) & Vector(i)< ul(2))
                 limits{k}.LacalVec = [limits{k}.LacalVec , Vector(i) ];
              end 
           end      
   end
   q = [];
   for k = 1:lm(2)
           c = size(limits{k}.LacalVec);
           if(c(1) > 0 )       
               m = int16(mean(limits{k}.LacalVec));
               s = int16(std(limits{k}.LacalVec));
           else
               m = 0;
               v = 0;
           end
           q = [q m s];  
   end

   
   
   
 
   
   
   
   
   
   
   
   
   