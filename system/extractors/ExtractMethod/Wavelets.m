function matrices = Wavelets(matrix1)
[matrices{1},s] = wavedec2(double(matrix1),2,'db2');
