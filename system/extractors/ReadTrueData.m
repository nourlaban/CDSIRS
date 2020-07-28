function tifinfo = ReadTrueData(TrueDataRootPath,DataPath)
    tifs = dir([DataPath,'\*.tif']);
    s = size(tifs);
    tifinfo = {};
    for i = 1:s(1)   
        [pan_I, pan_R, bbox] = geotiffread([DataPath,'\',tifs(i).name]);
        tifinfo{i}.path = [DataPath,'\',tifs(i).name];
        tifinfo{i}.ref = pan_R;
        tifinfo{i}.box = bbox;     
    end


        trainpath =[TrueDataRootPath,'\train_Shapefile.shp'] ;
        testpath =[TrueDataRootPath,'\test_Shapefile.shp'] ;

    for i = 1:s(1)
        tifinfo{i}.train = GetTifSHP(tifinfo{i},trainpath);
        tifinfo{i}.test  = GetTifSHP(tifinfo{i},testpath);
    end
    


function pixshp =  GetTifSHP(tiffileinfo,shpfilepath)
  
    shp = shaperead(shpfilepath);
    fileshp = findshape(tiffileinfo,shp);

    pixshp = {};
    z = size(fileshp);    
    for j = 1:z(2)
       RC = pixRC(tiffileinfo.ref , fileshp{j}.X , fileshp{j}.Y);
       BoundingBox =  fileshp{j}.BoundingBox;       
       rect = GetPicRect(tiffileinfo.ref,BoundingBox);
       pixshp{j}.RC     = RC;
       pixshp{j}.rect   = rect ;       
    end


function rect = GetPicRect(ref,BoundingBox)
       [p1.r,p1.c] =  map2pix( ref, BoundingBox(1,1), BoundingBox(1,2));
       [p2.r,p2.c] =  map2pix( ref, BoundingBox(2,1), BoundingBox(2,2)); 

       startp.r = p2.r;
       startp.c = p1.c;
       endp.r   = p1.r;
       endp.c   = p2.c;

       p1.c = int32(p1.c);
       p1.r = int32(p1.r);
       p2.c = int32(p2.c);
       p2.r = int32(p2.r);

       startp.r = p2.r;
       startp.c = p1.c;
       endp.r   = p1.r;
       endp.c   = p2.c;

       rect = [startp.r startp.c endp.r endp.c  endp.r-startp.r  endp.c-startp.c];
      




function RC = pixRC(ref , Xarray , Yarray)
    RC = [];
    s = size(Xarray);
    for i = 1:s(2)-1
        [r,c] =  map2pix( ref, Xarray(i), Yarray(i) );
        r   =   int32(r);
        c   =   int32(c); 
        RC = [RC;r,c];
    end




function  fileshp = findshape(tifinfo,shpinfo);
    fileshp = {};
    k = 1; 
    s = size(shpinfo);
    for i = 1:s(1)  
        f = findbox(shpinfo(i).BoundingBox, tifinfo.box);
        if(f)  
            fileshp{k} = shpinfo(i);  
            k = k +1;
        end

    end



function f = findbox(shpbox , tifbox)
        sp1.x = shpbox(1,1);
        sp1.y = shpbox(1,2);

        sp2.x = shpbox(2,1);
        sp2.y = shpbox(2,2);


        tp1.x = tifbox(1,1);
        tp1.y = tifbox(1,2);

        tp2.x = tifbox(2,1);
        tp2.y = tifbox(2,2);

        d1 = pointdis(sp1,tp1);
        d2 = pointdis(sp2,tp1);
        d3 = pointdis(sp1,tp2);
        d4 = pointdis(sp2,tp2);

        d = [d1;d2;d3;d4];

        if( d1 > 0 & d2 > 0 & d3 < 0 & d4 < 0 )
        f = 1;
        else
          f = 0;
        end


function d = pointdis(p1,p2)
        d =[ p1.x-p2.x p1.y-p2.y];



