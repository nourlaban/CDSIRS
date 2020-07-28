function newtiles = delcell(tiles,index)
newtiles = {};
s = size(tiles);

for i =1: index -1  
    newtiles{end+1}.rect        =   tiles{i}.rect;   
    newtiles{end}.imagesize     =   tiles{i}.imagesize;
    newtiles{end}.del           =   tiles{i}.del;
end


for i =index+1 : s(2)
   newtiles{end+1}.rect        =   tiles{i}.rect;   
   newtiles{end}.imagesize     =   tiles{i}.imagesize;
   newtiles{end}.del           =   tiles{i}.del;
end