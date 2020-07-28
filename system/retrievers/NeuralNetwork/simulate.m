function samearray =  simulate(net,samearray)
        disp 'simulate is started'   
       datafeatures     = samearray.datafeatures';
       datarects        = samearray.datarects ;
       
       
       z                = size(datarects);
       s                = size(datafeatures);
       
       for j = 1:s(2)
           a                    =   datafeatures(1:end,j);
           b                    =   sim(net,a);
           datarects(j,z(2)+1)  =   b;
       end  
   
  
       datarects =  sortrows(datarects,6);
       samearray.datarects = datarects;
       
       disp 'simulate is ended'
       