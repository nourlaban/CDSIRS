function samearray = rearrange(samearray)
        samearray.datarects         = [samearray.datarects;samearray.testrects] ;
        samearray.datafeatures      = [samearray.datafeatures;samearray.testfeatures];       
        c1                          = samearray.datarects(:,1);
        d1                          = [c1,samearray.datafeatures];
        
        samearray.datarects         = sortrows(samearray.datarects, 1 );
        d1                          = sortrows(d1, 1 );
        samearray.datafeatures      = d1(:,2:end);