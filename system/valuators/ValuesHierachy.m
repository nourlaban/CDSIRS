function  areaobject = ValuesHierachy(work)
        
        evaluatorspath              = [work.WorkPath , work.subworkpath, work.evaluates ];
        retrievalpath               = [work.WorkPath , work.subworkpath, work.retrievals];
        currentwork.evaluatorspath  = evaluatorspath;
        currentwork.retrievalpath   = retrievalpath;  
        areaobject                  = getareaobject(work,currentwork);
        
        
    function areaobject = getareaobject(work,currentwork)
        areaobject = {};
        k = 1; 
        retrievals = dir(currentwork.retrievalpath);   
        for i = 3 : numel(retrievals)
             if(retrievals(i).isdir)                
                 sublevel                   = [currentwork.retrievalpath,retrievals(i).name];
                 
                 areaobject{k}.area         = retrievals(i).name;
                 areaobject{k}.areapath     = [currentwork.evaluatorspath,retrievals(i).name];
                 
                 currentwork.retrievalsname = retrievals(i).name;
                 
                 stageobject                = getstageobject(sublevel,work,currentwork);
                 
                 areaobject{k}.stages       = stageobject;
                 k = k + 1;
             end
        end
                 
                 
        
    function  stageobject = getstageobject(superlevel,work,currentwork)
         stageobject = {};
         k = 1;                 
         stages = dir(superlevel);
                 for  i = 3:numel(stages)
                     if(stages(i).isdir)
                        sublevel                =   [superlevel,'\',stages(i).name];
                        stageobject{k}.stage    =   stages(i).name;
                        stageobject{k}.methods   =   getmethodobject(sublevel,work,currentwork); 
                        k                       =	k+1;
                     end
                 end
                 
         function  methodobject = getmethodobject(superlevel,work,currentwork)                 
                 methodobject = {};
                 k = 1; 
                 methods = dir(superlevel);
                 for  j = 3:numel(methods)
                     if(methods(j).isdir)
                        sublevel                    = [superlevel,'\',methods(j).name];
                        methodobject{k}.methods      = methods(j).name;
                        
                        currentwork.methodname      =  methodobject{k}.methods ;
                        methodobject{k}.engines     = getengineobject(sublevel,work,currentwork);
                        k                           = k + 1;
                     end
                 end

        
                 
        function  engineobject = getengineobject(superlevel,work,currentwork)
                engineobject = {};
                k = 1; 
                rengines =  dir(superlevel);
                 for  i = 3:numel(rengines)
                    if(rengines(i).isdir)
                       engineobject{k}.engine   = rengines(i).name; 
                       currentwork.renginename  = rengines(i).name;
                       
                       sublevel = [superlevel,'\',rengines(i).name]; 
                       engineobject{k}.overlapobject =  getoverlapobject(sublevel,work,currentwork) ;
                       k = k + 1;
                    end
                 end
               

                 
                 
        
        function overlapobject = getoverlapobject(superlevel,work,currentwork) 
            overlaps = dir(superlevel);
            overlapobject   = {};
            k              = 1;
            for h = 3:numel(overlaps)
              if(overlaps(h).isdir)  
                    overlapobject{k}.overlaps           = overlaps(h).name;
                    overlapobject{k}.testpath           = [work.TrainTestPath.Area,'\',currentwork.retrievalsname,'\test.shp' ];
                    overlapobject{k}.fullretrivalpath   = [superlevel,'\',overlaps(h).name]; 
                    overlapobject{k}.fullevaulatepath   = [currentwork.evaluatorspath,currentwork.retrievalsname,...
                           '\',currentwork.methodname,'\',currentwork.renginename,'\'];
                    k = k + 1;
             end
            end           
        



