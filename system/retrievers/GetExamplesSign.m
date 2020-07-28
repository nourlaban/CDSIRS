function  ExamplesSign =  GetExamplesSign(ExampleFilePath)
ExampleFile = [ExampleFilePath,'\Examples.xsign'];
file   = fopen( ExampleFile , 'r' );
 ExamplesSign = {}; 
p = 1;
while 1 
    str =  fscanf(file,'%s/t/t',1);
    if(isempty(str) )        
        break ;        
    end
    ExamplesSign{p}.examplename =  str;    
    featurevector  =  fscanf(file,'%g');
     fscanf(file,'%c/n');
    ExamplesSign{p}.examplefeatures = featurevector;
    p = p + 1;    
end

fclose(file);