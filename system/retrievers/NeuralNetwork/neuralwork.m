function samearray = neuralwork(FeaturesObject,code)
        disp 'neuralwork is started'    
      
            samearray   = CombineALL(FeaturesObject,code);
       
       
        trainfeatures                = samearray.trainfeatures;          
        trainfeatures(:,end+1)      = 0;        
        nondata = getNonData(samearray);
        samearray.trainfeatures     = [trainfeatures;nondata];
        
        
       samearray       = rearrange(samearray);
         
        
       net              = createffnn(samearray);
       net              = trainnet(net,samearray);
       close all;
     
       samearray =  simulate(net,samearray);
       
       disp 'neuralwork is ended'    
       
              
       
        function nondata = getNonData(samearray)
            s                           = size(samearray.trainfeatures);
            z                           = size(samearray.datafeatures);
            nondata =[];
            
            for i = 1: s(1)*4
               f =  floor ( rand() + z(1) );
            nondata                    = [nondata ;samearray.datafeatures(f,:)] ;
            end
            nondata(:,end+1)        	= 1;
       
    
   