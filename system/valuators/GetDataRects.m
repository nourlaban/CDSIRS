function  DataRectsObject =  GetDataRects(FeaturesChannel)
        FeaturesFiles =    dir([FeaturesChannel,'\*.dsign']);
        DataRectsObject = {};
        s =  size(FeaturesFiles);
        for i = 1:s(1)
            FileName =    FeaturesFiles(i).name;
            d = strfind(FileName,'.');
            scenename = FileName(1:d-1);
            FilePath = [FeaturesChannel,'\',FileName];
            FileObject = GetFileRects(FilePath);

            DataRectsObject{i}.scenename = scenename;
            DataRectsObject{i}.Rects = FileObject; 
        end


function FileObject = GetFileRects(FilePath)
        file            = fopen( FilePath , 'r' );
        [t dataRects ]   = getdatarects(file);        
        [t trainRects]   = getdatarects(file);
        if(t == 's' )
            testRects   = trainRects;
            trainRects  = [];            
        else           
          [t testRects  ]  = getdatarects(file);
        end
        fclose(file);

        defpath = cd;
        cd('..\common')
            trainRects  = GetRectRelation(dataRects,trainRects);
            testRects   = GetRectRelation(dataRects,testRects);
        cd(defpath);



  
        FileObject.trainRects    =   trainRects;
        FileObject.testRects     =   testRects;


function  [t datarects] = getdatarects(file)
        datarects    = {};
        p = 1;
        while 1 
            featurevector  =  fscanf(file,'%g');
            s = size(featurevector);
            if(s(1) == 0)        
                break ;        
            end
            fscanf(file,'%c/n');
            datarects{p}.rect = featurevector(1:4);   
            p = p + 1;    
        end
       t =  fscanf(file,'%c/n');
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        

