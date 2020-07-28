    function AreaObjects = getSemanticArea(AreaPath,Duties,CurrentDuties)
           
       k= 1;
       AreaObjects = {};
       for i = 1:numel(Duties.semantics)
           if ( CurrentDuties.Semantic(i)  )
               pr =  [AreaPath,'\',Duties.semantics{i},'\train.shp'];
               ps =  [AreaPath,'\',Duties.semantics{i},'\test.shp'];

               AreaObjects{k}.name          =  Duties.semantics{i};
               r                            = shaperead(pr) ;
               shpinf                       = calcArea(r);
               AreaObjects{k}.Train         = shpinf.shp;
               AreaObjects{k}.TrainArea     = shpinf.area;                      
               AreaObjects{k}.TrainArea     = shpinf.area;
               
               
               
               t                            = shaperead(ps) ; 
               shpinf                       = calcArea(t);
               AreaObjects{k}.Test          = shpinf.shp ;               
               k                            = k +1;               
           end
       end
        
          
   
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
            