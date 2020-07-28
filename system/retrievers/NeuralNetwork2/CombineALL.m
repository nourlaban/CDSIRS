function samearray = CombineALL(FeaturesObject)
        samearray       = {};
        dvalues         = [];drects       = [];
        rvalues         = [];rrects       = [];
        tvalues         = [];trects       = [];

        for i = 1:numel(FeaturesObject)
           datafeatures         = FeaturesObject(i); 
           [dvalues , drects , tvalues , trects , rvalues , rrects]    = getall(datafeatures ,...
                                               dvalues , drects , tvalues , trects , rvalues , rrects);
        end

        samearray.datafeatures      =   dvalues;
        samearray.datarects         =   drects;


        samearray.trainfeatures     =   rvalues;
        samearray.trainrects        =   rrects;


        samearray.testfeatures      =   tvalues;
        samearray.testrects         =   trects; 
        samearray.trainbundle       =   [rvalues(:,:);dvalues(1:100,:)];



function [dvalues , drects , tvalues , trects , rvalues , rrects]  = getall(datafeatures ,...
                                             dvalues , drects , tvalues , trects , rvalues , rrects)
       
       z = size( datafeatures); 
       for j = 1:z(2)
        r = datafeatures.BoundingBox;
        v = datafeatures.featurevect;
        [r,v] = reformat(r,v);
                if (datafeatures(j).train == 0 )
                     dvalues  = [dvalues   ;  v,0];
                     drects   = [drects    ;  r,0]; 

                elseif (datafeatures(j).test == 1 && datafeatures(j).train == 0)
                     tvalues  = [tvalues   ;  v,1];
                     trects   = [trects    ;  r,0]; 

                elseif (datafeatures(j).test == 0 && datafeatures(j).train == 1)
                     rvalues  = [rvalues   ;  v,1];
                     rrects   = [rrects    ;  r,0]; 
                end 
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
