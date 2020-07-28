function matrices = FFTFeatures(matrix1)
 matrices{1} = real( fft2(double(matrix1)));                         %compute FFT for The Matrix 