function mattrices = InMatrix(ImageMatreces)
         infer = 4;
         [r c l] = size(ImageMatreces);
         ir = floor(r/infer);
         ic = floor(c/infer);

         mattrices.innerfactor = 1;
         mattrices.outerfactor = 1;
         
         
         mattrices.innerimages{1}   = ImageMatreces(ir:r-ir,ic:c-ic,:); 
         
         mattrices.outerimages   = {};
         