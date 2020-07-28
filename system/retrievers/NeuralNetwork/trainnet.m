% Version : 5.3
% Date : 12.01.2010
% Author  : Omid Bonakdar Sakhi

function net = trainnet(net,samearray)
disp 'trainnet is started'  
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
net.trainFcn = 'trainscg';
net.trainParam.lr = 0.4;
net.trainParam.epochs = 1000;
net.trainParam.show = NaN;
net.trainParam.goal = 1e-5;
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
trainfeatures = samearray.trainfeatures;
P{1,1} = trainfeatures(:,1:end-1)';
T{1,1} = trainfeatures(:,end)';

[net,tr,Y,E,Pf,Af] = train(net,P,T);
disp 'trainnet is ended' 
