function d = vectorDistance(values,examplefeatures)
v = size(values);
d = 0;
for i = 1:v(2)
  m = abs( values(i) - examplefeatures(i));
  d = d + m;  
end

