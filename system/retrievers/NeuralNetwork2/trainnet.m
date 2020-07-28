% Version : 5.3
% Date : 12.01.2010
% Author  : Omid Bonakdar Sakhi

function net = trainnet(net,samearray)

%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
net.trainFcn = 'trainscg';
net.trainParam.lr = 0.4;
net.trainParam.epochs = 200;
net.trainParam.show = NaN;
net.trainParam.goal = 1e-3;
%~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
trainbundle = samearray.trainbundle;
T{1,1} = trainbundle(:,end)';
P{1,1} = trainbundle(:,1:end-1)';

[net,tr,Y,E,Pf,Af] = train(net,P,T);

