function features = getFeatureVector(ImageMatreces,FileParameters)
         s = size(ImageMatreces);
         features = [];
        for i = 1:s(3)
           BandMatrix = ImageMatreces(:,:,i);       
           v = matrixFeatures(BandMatrix,FileParameters);       
           features =[features,v];
      	end      


        
         
         