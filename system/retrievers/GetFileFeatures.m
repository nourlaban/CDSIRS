function  FileObject = GetFileFeatures(scenename,FilePath)  
        file            = fopen( FilePath , 'r' );
        fgetl(file);
        
        a1 = fscanf(file, '%g %g', [2 inf]);fscanf(file, '%c/n');
        a2 = fscanf(file, '%g %g', [2 inf]);fscanf(file, '%c/n');
        a3 = fscanf(file, '%g %g', [2 inf]);fscanf(file, '%c/n/n'); 
        geo = [a1'; a2';a3'];
        fgetl(file);
        fgetl(file);         
        b1 = fscanf(file, '%g %g', [2 inf]);fscanf(file, '%c/n');
        b2 = fscanf(file, '%g %g', [2 inf]);fscanf(file, '%c/n');       
        box = [b1';b2'];
        fgetl(file);
        fgetl(file);
        datafeatures    = {};
        for j = 1:3            
            p = 1;
            while 1 
                featurevector  =  fscanf(file,'%g');
                s = size(featurevector);
                if(s(1) == 0)        
                    break ;        
                end
                fscanf(file,'%c/n');
                datafeatures{p}.rect = featurevector(1:4);
                datafeatures{p}.values = featurevector(5:s(1));    
                p = p + 1;    
            end
           
            
        end               
        fclose(file);


        FileObject.scenename        =   scenename;
        FileObject.geo              =   geo;
        FileObject.box              =   box;
        FileObject.datafeatures     =   datafeatures;








