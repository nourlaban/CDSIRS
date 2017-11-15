function SystemManager        
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
        % extractor experiment 
        % we have two parameters control extraction  process   
        % extraction method histrogrm , waveletes , FFT DCT , compinations
        % of these methods 
        % statistics used after features extraction either 2 bins (mean
        % starndard deviation of each band ) or 4 or more  bins using quantaization
        % process 
        % different tiles size by meters starting from 150 m * 150  and increased gradually to 8000 * 8000                                         
        
        CurrentDuties.EM        = 5 ;
        
        CurrentDuties.SM        = 1	    ;   CurrentDuties.SZ              = [3 4]  ;
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%        
        % retriever experiment
        % we have determine some parameters that affect the retrieval
        % process 
        % retrieval engine either nearest  nieghbor algorthm or neural
        % network or any other methods 
        % the second parameter is the degree of intersection between 
        % the resulted rectangular tiles and the polygon area of training 
        % data which determine the degree purity of the resulting traing 
        % tiles  
               
        CurrentDuties.RE        = 1             ;   CurrentDuties.TXP       = 2       ;
        
        % detemining the location of of the name of the properties used by
        % corrent process using the shapefile data base  if 0 0 all is
        % used 
        CurrentDuties.CMES      = 1            ; 
        
        %retriever parameters
        % uaing the k nearest nearghbor aproaches of the resulting results  
        % , and the step of  the subset of the results 
        % roundk is the next step k and also the roundstep is the nest step
        % Xtrain is the percent of area of intersection betwwen the
        % resulted tiles the training polygon area  
        % round number of rounds used .
        
        retreive.k          = 0.10  ;   retreive.step           = 0.02    ; 
        retreive.roundk     = 1     ;   retreive.roundstep      = 0.2     ;
        retreive.XTrain     = 0.2   ;   retreive.round          = 2       ; 
              
        %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
                                    %['cloud'}; 
        CurrentDuties.Semantic      =    1 ;
        s = 6;
        for i =1:numel(s)
        
                                    %[extractor fsigners  retriever   valuator  ]
        stages                      =[   1         1      1            1       ]  ; 
        
%                                    satelitte ['s1','s2','s3','s4','s5','s6','s7','s8','s9','s10']
                                    %[satellite   experiment   features signature retrieval  values ]
        experiment                  =[   s(i)          1            1         1          1        1    ];
        
         OrderTransfomer( stages,experiment,CurrentDuties,retreive);
         s(i)      
        end
        
    
        