function ComVect = Stat4Bins(matrices)
c =size(matrices);
ComVect = [];
for i = 1:c(2)
    matrix = matrices{i};
    vector = getSingleMethod(matrix);
    ComVect = [ComVect vector];
end

function vector = getSingleMethod(matrix)
z = size(matrix);
def  = cd();
if(z(2) == 1)
   cd([def,'\quantize']);
   q = quantize1D(matrix,4);
   cd(def);
else
   cd([def,'\quantize']);
   q = quantize2D(matrix,4);
   cd(def);
end

vector = q;