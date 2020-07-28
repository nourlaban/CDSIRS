function realinfo = RandomTrain(realinfo1)
        realinfo    =   realinfo1;
        s           =   size(realinfo);
         m = [];
        for i = 1:s(2)
            train   =   realinfo{i}.train ;           
            test    =   realinfo{i}.test;
            m =[m;GetMatrix(i ,1, train);GetMatrix(i ,0, test)];
        end
      trainIDX = GettrainInfo(m,10) ; 
      ms = size(m);     
         for j = 1:10
            m(trainIDX(j),1) = 1;             
         end
      
      
      
      
      
      
      for i = 1:s(2)
          train2    = {};a = 1;
          test2     = {};b = 1;
          for j = 1:ms(1)
              if(m(j,2) == i)
                    if(m(j,1))
                        if(m(j,3))
                          train2{a} =  realinfo{i}.train{m(j,4)};
                          a = a+1;
                        else
                          train2{a} =  realinfo{i}.test{m(j,4)};
                          a = a+1;
                        end

                    else
                         if(m(j,3))
                          test2{b} =  realinfo{i}.train{m(j,4)};
                          b = b+1;
                        else
                          test2{b} =  realinfo{i}.test{m(j,4)};
                          b = b+1;
                        end



                    end
              end
          end
          realinfo{i}.train = train2;
          realinfo{i}.test = test2;
      end
  
    
    
    
    
    function trainIDX = GettrainInfo(m,kr)        
        z = size(m);
        trainIDX = ceil(z(1).*rand(kr,1));
        
        
   
        
    function  m = GetMatrix(ind ,t, obj)
        s = size(obj);
        m = [];
        for i = 1:s(2)
            v = obj{i}.features;
            m = [m;0,ind,t,i,v];
        end
        
        
        
  
        
        
        
    
