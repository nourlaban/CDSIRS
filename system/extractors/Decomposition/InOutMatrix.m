   function mattrices = InOutMatrix(ImageMatreces)
         infer = 4;
         [r c l] = size(ImageMatreces);
         ir = floor(r/infer);
         ic = floor(c/infer);

         mattrices.innerfactor = 2;
         mattrices.outerfactor = 1;
         
         
         mattrices.innerimages{1}   = ImageMatreces(ir:r-ir,ic:c-ic,:); 
         
         mattrices.outerimages{1}   = ImageMatreces(1:ir,1:c,:);
         mattrices.outerimages{2}   = ImageMatreces(r-ir:r,1:c,:);
         mattrices.outerimages{3}   = ImageMatreces(ir:r-ir,1:ic,:);
         mattrices.outerimages{4}   = ImageMatreces(ir:r-ir,c-ic:c,:);