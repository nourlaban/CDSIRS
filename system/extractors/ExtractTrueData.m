function realinfo  = ExtractTrueData(FileParameters,realinfo)
        s =  size(realinfo);
       
        for i = 1:s(2)
            fullpath = realinfo{i}.path;
            im  =   imread(fullpath);


            train  =  realinfo{i}.train;
            z = size(train);
                for j = 1:z(2)
                  rect      =   train{j}.rect;
                  matrices  =   im(rect(1) : rect(3)     ,  rect(2)  :  rect(4) ,:);
                  train{j}.features = getFeatureVector(matrices,FileParameters); 
                end
            realinfo{i}.train = train; 


            test   = realinfo{i}.test;
            t = size(test);
                for j = 1:t(2)
                  rect      =   test{j}.rect;
                  matrices  =   im(rect(1) : rect(3)     ,  rect(2)  :  rect(4) ,:);   
                  test{j}.features = getFeatureVector(matrices,FileParameters); 
                end
            realinfo{i}.test = test;    
        end
