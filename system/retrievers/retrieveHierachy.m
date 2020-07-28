function  channels = retrieveHierachy(work,AreaObjects)

        FeaturesRootPath    = [work.WorkPath ,work.subworkpath,work.features];
        dz                  =  dir(FeaturesRootPath); 
        channels            = {};
       k = 1;
       for j = 3:numel(dz)
           sizerootpath     =    [FeaturesRootPath, dz(j).name];
            dm              =    dir([sizerootpath,'\*.meta']);
            fid = fopen([sizerootpath,'\',dm(1).name],'r');str = fgetl(fid);fclose(fid);
             channels.FeaturesChannel{k}.fullpath      =       sizerootpath;
             channels.FeaturesChannel{k}.tilesize      =       dz(j).name;
             
            
             dim = parse(str);            
             for i = 1 : numel(dim); 
               channels.FeaturesChannel{k}.methods{i}.name          =       [dz(j).name,'_',dim{i}.name];
               channels.FeaturesChannel{k}.methods{i}.Ename         =       dim{i}.name ; 
               channels.FeaturesChannel{k}.methods{i}.code          =       dim{i}.code;
             end 
          
               k = k  + 1 ;
            
       end
       
     
         for i = 1:numel(AreaObjects)
             channels.RetrievalChannel{i}.name     =       AreaObjects{i}.name;                  
         end
    function dim = parse(str)
          a = strfind(str,'%');
          s = 1;
          strs = {};
          for i = 1:numel(a)
          strs{i} = str(s:a(i)-1);
          s = a(i)+1;
          end
          
          dim = {};
          
          for i = 1 :numel(strs)
             astr =  strs{i};
             d = strfind(astr,'#');
             dim{i}.code = astr(1:d(1)-1);
             dim{i}.name = astr(d(1)+1 :end);
          end
         
          
          
          
          
          
          
         
         
         
         