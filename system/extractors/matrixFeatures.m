  function  Vector=  matrixFeatures(matrix,FileParameters)
      def = cd;      
      currdir   =   cd([def,'\', FileParameters.EMFdir]); 
      EMFHandle =   str2func( FileParameters.EMFName) ;
      matrices   =   EMFHandle(matrix);
      cd(def); 
      
      currdir   =   cd([def,'\', FileParameters.SBFdir]); 
      SBFHandle =   str2func( FileParameters.SBFName) ;
      Vector    =   SBFHandle(matrices);
      cd(def);            
      