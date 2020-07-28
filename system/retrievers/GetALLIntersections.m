function [KonwnObject index] = GetALLIntersections(AreaObjects,FeaturesObjects,Xpercent,XTrain,index) 
       disp 'GetALLIntersections started'
       KonwnObject = {};
       for i = 1:numel(AreaObjects)
           a = AreaObjects{i};
           
           s = size(index);
           for k = 1:s(1)
                if(index(k,1+i) == -1)
                   j = index(k,1);
                   b = FeaturesObjects{j};
                   b = GetTrain(a,b,Xpercent,XTrain);
                   b = GetTest(a,b,Xpercent);
                   if(~isempty(b))
                           KonwnObject.Area{i}.method               = b;
                           KonwnObject.Area{i}.name                 = AreaObjects{i}.name;
                           KonwnObject.Area{i}.wholetrain           = AreaObjects{i}.Train;
                           KonwnObject.Area{i}.wholetest            = AreaObjects{i}.Test;
                           KonwnObject.Area{i}.privousshpsbuffer    = [];
                           KonwnObject.Area{i}.roundpath            = [];
                           index(k,1+i)                             = 1;
                           break;
                   else
                           index(k,1+i) = 0;
                   end
                end
           end
       
       end
      disp 'GetALLIntersections ended'
       
    
       
       
       
       
      
       
       
       
       
