function nextstage  =    retriever( work,CurrentDuties,engine, SemanticObjects,retreive,Xpercent,nextstage,stage )
for i = 1:numel(SemanticObjects.Area)    
   FeaturesObjects   =   SemanticObjects.Area{i} ;
   CMCS              =   CurrentDuties.CMCS;
   CMES              =   CurrentDuties.CMES;
  
       if(numel(CMCS)> 0 && numel(CMES)> 0 ) 
           AMS = getmethods(CMCS,CMES);
           methodsnumber = numel(AMS);
       else
           methodsnumber = numel(FeaturesObjects.method.methods);
           AMS           = 1: numel(FeaturesObjects.method.methods);
       end
       
   for j = 1:methodsnumber
           
           Featuresmethod           =   FeaturesObjects.method;
           privousshpsbuffer        =   FeaturesObjects.privousshpsbuffer;
           roundpath                =   FeaturesObjects.roundpath;
           super.area               =   SemanticObjects.Area{i}.name;
           
           super.method             =   FeaturesObjects.method.methods{AMS(j)}.name;
           
           super.engine             =   engine;
           super.wholetest          =   FeaturesObjects.wholetest;
           super.wholetrain         =   FeaturesObjects.wholetrain;
           super.code               =   FeaturesObjects.method.methods{j}.code;
           super.trainoverlap       =   [num2str(Xpercent * 100),'% TrainOverlap'];
           
           
           samearray                =   EclidianDistance(Featuresmethod.FeaturesObject,super.code) ;
          
           nextstage               = WriteResults(work,super,samearray,Featuresmethod,retreive,nextstage,roundpath,privousshpsbuffer,stage);
%            [j methodsnumber i numel(SemanticObjects.Area)];
   end
end

function AMS = getmethods(A,B)
           AMS = [];
          
           for a = 1: numel(A)
               for b = 1: numel(B)
                   AMS  = [AMS,A(a)*B(b) ];
               end
           end





