function  WriteValues(retrievalsobject)

        warning off MATLAB:xlswrite:AddSheet
        array = alfabet(); 
        
        for i = 1:numel(retrievalsobject)
               area                     = retrievalsobject{i}.area;  
               EvalsRootPath            = retrievalsobject{i}.areapath;
               
               mkdir(EvalsRootPath);
               for q = 1:numel(retrievalsobject{i}.stages)
                   stage = retrievalsobject{i}.stages{q}.stage;
               
                   FilePath        = [EvalsRootPath,'\',area,'_',stage,'_evaulation.xls'];

                   copyfile('evaulation.xls',FilePath);


                   for j = 1:numel(retrievalsobject{i}.stages{q}.methods)
                        method =  retrievalsobject{i}.stages{q}.methods{j}.methods;                   

                               for k =1:numel(retrievalsobject{i}.stages{q}.methods{j}.engines)
                                    for h = 1:numel(retrievalsobject{i}.stages{q}.methods{j}.engines{k}.overlapobject)

                                           engine               = retrievalsobject{i}.stages{q}.methods{j}.engines{k}.engine;
                                           results              = retrievalsobject{i}.stages{q}.methods{j}.engines{k}.overlapobject{h}.results; 
                                           overlap              = retrievalsobject{i}.stages{q}.methods{j}.engines{k}.overlapobject{h}.overlaps;
                                           n                    = numel(results);

                                           matrix1 = [overlap;{'-'};{[engine,' %']}];
                                           matrix2 = [{method},{'-'};{'Recall'} ,{'Precision'}];

                                          for p = 1:n
                                              name              =   results{p}.name       ;     
                                              recall            =   results{p}.recall     ;    
                                              precision         =   results{p}.precision  ; 

                                              matrix1           =   [matrix1;name];

                                              matrix2           =   [matrix2;{recall},{precision}];
                                          end 

                                          xlswrite(FilePath, matrix1,engine,['a',num2str( ( (n+3) * (h-1))+ 1 )]);
                                          xlswrite(FilePath, matrix2,engine,[array{2*j},num2str( ( (n+3) * (h-1))+ 2 )]);
                                    end

                               end
                   end
               end
        end
        

        
