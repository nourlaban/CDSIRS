function samearray = EclidianDistance(FeaturesObject,code)

    samearray       = CombineALL(FeaturesObject,code);   
    datafeatures    = samearray.datafeatures;
    datarects       = samearray.datarects ;
    z               = size(datarects);
    s               = size(datafeatures);

    for i = 1:s(1)
        if(~isempty(samearray.trainfeatures))
       n                    =  Nearest(datafeatures(i,:),samearray.trainfeatures);
       datarects(i,z(2)+1)  = n;
        else
            error(' no training dateset found ');           
        end
    end
    samearray.datarects = datarects;



       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
       
