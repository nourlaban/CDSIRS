function Extractor(pathes,work ,Duties,CurrentDuties)


        parameters = {};
        para = 1;

        EMFdir  =   pathes.EMFdir ;
        SBFdir  =   pathes.SBFdir ;
       

        
     
        EMS = size(CurrentDuties.EM);
        SBS = size(CurrentDuties.SM);        
        SZS = size(CurrentDuties.SZ);
        
        
         ALLEM                   = Duties.ExtractorsMethods;
         ALLSM                   = Duties.Statistics;
                  
            
                    for j = 1:EMS(2)
                        for k = 1:SBS(2)
                           

                                                             
                               
                                EMFName                 = ALLEM(CurrentDuties.EM(j));
                                FileParameters.EMFName  = EMFName{1} ;
                                FileParameters.EMFdir   = EMFdir;
                               
                                SBFName                 = ALLSM(CurrentDuties.SM(k));
                                FileParameters.SBFName  = SBFName{1} ;
                                FileParameters.SBFdir   = SBFdir;
                                
                                 FileParameters.StateName       = [EMFName{1},'_',SBFName{1}];
                                 FileParameters.StateCode        = ['C',num2str(j),'_',num2str(k) ];
                                 FileParameters.FullStateName   = [FileParameters.StateCode,'#',FileParameters.StateName];
                                 
                                 
                                                                
                                 parameters{para}           = FileParameters ;
                                 para                       = para +1;
                            
                        end
                    end
             
                
               
                
                 for c = 1:SZS(2)
                      ALLSZ    = Duties.Sizes;
                      SZ       = ALLSZ{CurrentDuties.SZ(c)}; 
                      work.FeaturesSizePath         = [work.FeaturesRootPath,'\', 'S',mat2str(SZ)]; 
                      mkdir(work.FeaturesSizePath);
                      
                      ExtractorSpecific(work,parameters,SZ);
             
                end


function ExtractorSpecific(work,parameters,SZ)
       
        data            = dir([work.DataPath,'\*.tif']);
        Shpfeatures     = [];      
        for i =1:numel(data)    
             f                =  scenefeatures(work ,data(i).name ,parameters,SZ); 
             Shpfeatures      = [Shpfeatures;f];
             [SZ i]
        end
        
        
         AllStateName = [];
         for  i = 1:numel(parameters)
                AllStateName                      = [AllStateName,parameters{i}.FullStateName,'%'];
         end 
        fid = fopen([work.FeaturesSizePath,'\featureshp.meta'],'w'); fprintf(fid, '%s\n', AllStateName);fclose(fid);
        
        
        shapewrite( Shpfeatures,[work.FeaturesSizePath,'\featureshp.shp']);




 
 







 
 
   
