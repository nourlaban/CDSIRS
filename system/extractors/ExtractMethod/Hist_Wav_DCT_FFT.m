function matrices = Hist_Wav_DCT_FFT(matrix1)
matrices{1} = matrix1;
[matrices{2},s] = wavedec2(double(matrix1),2,'db2');
matrices{3} = dct2(matrix1);                         %compute DCT for The Matrix 
matrices{4} = real( fft2(double(matrix1)));          %compute FFT for The Matrix 