 function results = GetResult(ResultPath)
        file        =  fopen( ResultPath , 'r' );
        results = [];
        p = 1;
        while 1 
           Rate =  fscanf(file,'%g\t')';
           if(isempty(Rate))        
                break ;        
           end
           results= [results ;Rate];
           fscanf(file,'%c\t',1);
           p = p + 1;
        end
        fclose(file);