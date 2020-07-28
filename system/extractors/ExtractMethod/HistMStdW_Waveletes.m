function matrices = HistMStdW_Waveletes(matrix1)
matrices{1} = matrix1;
[matrices{2},s] = wavedec2(double(matrix1),2,'db2');
