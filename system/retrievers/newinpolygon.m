function a = newinpolygon(AX,AY,BX,BY)
                     a = 0;
                     ALLIN = [];
                     for i = 1:numel(BX)     
                         IN =  inpolygon(AX{1},AY{1},BX{i},BY{i});
                         ALLIN = [ALLIN,IN];
                     end
                     if(mean(ALLIN) ~= 0 )
                           a = 1;              
                     end