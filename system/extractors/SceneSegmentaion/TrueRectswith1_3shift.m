function tiles =TrueRectswith1_3shift(FullPath,dimWH , scenesize)
tiles1 = SceneRects(dimWH , scenesize ,0,0);

shiftiles1_3 = SceneRects(dimWH , scenesize ,.33,.33);
tiles2       = concatenatetiles(tiles1,shiftiles1_3);

shiftiles2_3  = SceneRects(dimWH , scenesize ,.33,.33);
tiles = concatenatetiles(tiles2,shiftiles2_3);

% realinfo = GetRealRelation(realinfo,tiles);
% tiles = excludereal(realinfo,tiles,1);


function t1 = concatenatetiles(t1,t2)
s1 = size(t1);
s2 = size(t2);

k = s1(2);
for i = 1: s2(2)
    t1{i+k}.rect    = t2{i}.rect;
    t1{i+k}.imagesize      = t2{i}.imagesize; 
end


                   

