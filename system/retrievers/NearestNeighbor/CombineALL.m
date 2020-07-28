function samearray = CombineALL(FeaturesObject,code)
        
        samearray       = {};
        dvalues         = [];drects       = [];
        rvalues         = [];rrects       = [];
       
        
        for i = 1:numel(FeaturesObject)
           datafeatures         = FeaturesObject(i); 
           [dvalues , drects  , rvalues , rrects]    = getall(datafeatures ,...
                                               dvalues , drects ,  rvalues , rrects,code);
        end

        samearray.datafeatures  =   dvalues;
        samearray.datarects     =   drects;
     


        samearray.trainfeatures  =   rvalues;
        samearray.trainrects     =   rrects;
     


       

function [dvalues , drects,  rvalues , rrects ]  = getall(datafeatures ,...
                                             dvalues , drects , rvalues , rrects,code)      
        r = datafeatures.BoundingBox;
        id= datafeatures.Id;
        v = datafeatures.(code);
        [r,v] = reformat(r,v);
        
                if ( datafeatures.train == 1 )
                 
                        rvalues  = [rvalues   ;   v];
                        rrects   = [rrects    ;id,   r];
                       
                    
                elseif ( datafeatures.train == 0 )                    
                     dvalues  = [dvalues   ;   v];
                     drects   = [drects    ;id,   r];
                    
                end 
        

                
    function [rr,vv] = reformat(r,v)
        value = v(2:numel(v)-1);
        s =   strfind(value,' ') ;
        vv = [];
        k = 1;
        start = 1;        
        for i = 1:numel(s)
         vv(k) = str2double( value(start:s(i)-1) )  ;
         start = s(i)+1;
         k = k + 1;
        end
        vv(k) = str2double( value( s( numel(s) ) : end) );
        rr =  [ r(1,1), r(1,2) ,r(2,1) ,r(2,2)];
 
        
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
                
     