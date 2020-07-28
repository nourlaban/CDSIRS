% Version : 5.3
% Date : 12.01.2010
% Author  : Omid Bonakdar Sakhi



function  net=createffnn(samearray)

        trainbundle = samearray.trainbundle;       
        s = size(trainbundle);
        
        minx    =   min (min(trainbundle(:,1:end-1)));
        maxx    =   max (max(trainbundle(:,1:end-1)));  
        

        net = network;

        net.numInputs       =   1;
        net.numLayers       =   3;

        net.biasConnect     =   [1;1;1];

        net.inputConnect    =   [1 ;...
                                 0 ;
                                 0];

        net.layerConnect    =   [0 0 0 ;...
                                 1 0 0;
                                 1 0 0];

        net.outputConnect   =   [0 0 1];                
        net.targetConnect   =   [0 0 1];

        netInputs           =   ones (s(2)-1,2);
        netInputs (1:end,1) =   minx;
        netInputs (1:end,2) =   maxx;
        net.inputs{1}.range =   netInputs;

        net.layers{1}.size  =   100;
        net.layers{2}.size  =   20;
        net.layers{3}.size  =   1;
        

        net.layers{1:2}.transferFcn = 'tansig';
        net.layers{1:2}.initFcn = 'initnw';

        net.initFcn = 'initlay';
        net.performFcn = 'msereg';
        net.trainFcn = 'trainscg';

        net = init(net);
     
        
        
        
        
        
        
     
        
        

      

        