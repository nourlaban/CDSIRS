function [pathes Duties] = setParametrs()
            
                pathes.EMFdir  =  'ExtractMethod';
                pathes.SBFdir  =  'StatisticsBins';

             %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Extraction %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                Duties.ExtractorsMethods    = {'HistogramMStd' 'Wavelets'             'DCTFeatures'...
                                               'FFTFeatures'   'HistMStdW_Waveletes'  'Hist_Wav_DCT_FFT'   'GLCMFeatures'};
                                           
                Duties.Statistics           = {'Stat2Bins' 'Stat4Bins'  'GLCMSTAT'};
                
                Duties.Sizes                = {[125 125]   [250 250] ...
                                               [500 500]   [1000 1000] ...
                                               [2000 2000] [4000 4000] ...
                                               [6000 6000] [8000 8000] };
                                           
                                           
                 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Retrieval %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%                          

                Duties.RetrieverEngine      = {'NearestNeighbor'  'NeuralNetwork'  'NearestMeanNeighbor' ...
                                                    'AssociativeRules'  'SVM'};
                Duties.TrainXpercent        = {.2 .4 .6 .8 1};
                
                Duties.semantics            = {'cloud'}; 
                
                
             