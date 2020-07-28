function n = Nearest(values,ExamplesMatrix)
s = size(ExamplesMatrix);
dv = [];
for i =  1:s(1)
    examplevect =  ExamplesMatrix(i,:);
    d = vectorDistance(values,examplevect);
    dv = [dv;d];    
end
n =  min(dv);
