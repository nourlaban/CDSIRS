function retriever( work,engine, SemanticObjects,k )
s1      =   size(SemanticObjects.Area);

for i = 1:s1(2)    
   FeaturesObjects  =   SemanticObjects.Area{i} ; 
   s2               =   size(FeaturesObjects.method);
   for j = 1:s2(2)
           Featuresmethod   =   FeaturesObjects.method{j};
           name.area        =   FeaturesObjects.name;
           name.method      =   Featuresmethod.name;
           name.engine      =   engine;
           samearray        =   neuralwork(Featuresmethod.FeaturesObject)    ;
           
           WriteResults(work,name,samearray,Featuresmethod,k);
   end
end





