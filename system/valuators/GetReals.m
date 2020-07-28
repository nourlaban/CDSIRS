function RealsObject = GetReals(FilePath)
file        =  fopen( FilePath , 'r' );
RealsObject = {};
p = 1;
while 1 
   FileName = fscanf(file,'%s\t\t',1);
   if(isempty(FileName))        
        break ;        
   end
   RealsObject{p}.FileName = FileName;
   RealsTiles =  fscanf(file,'%g',[2 inf])';
   
   s = size( RealsTiles) ;
   z = 0;
   z(1,s(1)) = 0 ;
   RealsTiles = [RealsTiles,z'];  
   RealsObject{p}.RealsTiles = RealsTiles;
   fscanf(file,'%c\n',1);
   p = p + 1;    
end
fclose(file);
