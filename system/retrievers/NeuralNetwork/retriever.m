function   nextstage  =    retriever( work,CurrentDuties,engine, SemanticObjects,retreive,Xpercent,nextstage,stage )
disp '';
disp 'retriever is started'
for i = 1:numel(SemanticObjects.Area) 
   FeaturesObjects   =   SemanticObjects.Area{i} ;
    CMES              =   CurrentDuties.CMES;
   
     
           for j = 1:CMES

                   Featuresmethod           =   FeaturesObjects.method;  
                   privousshpsbuffer        =   FeaturesObjects.privousshpsbuffer;
                   roundpath                =   FeaturesObjects.roundpath;
                   super.area               =   SemanticObjects.Area{i}.name;

                    super.method             =   FeaturesObjects.method.methods{CMES(j)}.name;

                   super.engine             =   engine;
                   super.wholetest          =   FeaturesObjects.wholetest;
                   super.wholetrain         =   FeaturesObjects.wholetrain;
                   super.code               =   FeaturesObjects.method.methods{j}.code;
                   super.trainoverlap       =   [num2str(Xpercent * 100),'% TrainOverlap'];


                   samearray                =   neuralwork(Featuresmethod.FeaturesObject,super.code) ;

                  nextstage                 = WriteResults(work,super,samearray,Featuresmethod,retreive,nextstage,roundpath,privousshpsbuffer,stage);
        
           end
end


disp 'retriever is ended'





