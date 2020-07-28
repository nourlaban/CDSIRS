 function realinfo = GetRealRelation(realinfo,tiles)
    s = size(realinfo);
    def = cd;
        cd([def,'\..\..\common'])
        for i=1:s(2)
               realinfo{i}.test =  GetRectRelation(tiles,realinfo{i}.test);  
               realinfo{i}.train = GetRectRelation(tiles,realinfo{i}.train);     
        end    
    cd(def);