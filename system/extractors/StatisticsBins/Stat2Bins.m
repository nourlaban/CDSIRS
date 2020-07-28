function ComVect = Stat2Bins(matrices)
c =size(matrices);
ComVect = [];
for i = 1:c(2)
    Matrix = matrices{i};
    vector = getSingleMethod(Matrix);
    ComVect = [ComVect vector];
end

function vector = getSingleMethod(Matrix)
z = size(Matrix);
if(z(2) == 1)
    m = int16(mean(Matrix));
     s = int16(std(double(Matrix))); 
else
    m = int16(mean2(Matrix));
    s = int16(std2(double(Matrix)));    
end

vector = [m s];
   