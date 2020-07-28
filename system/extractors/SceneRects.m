function tiles   = SceneRects(dimWH , bbox )
    imagesize       = dimWH;
    imagerows       = imagesize(1);
    imagecolumns    = imagesize(2);
    k       =   1;  
    tiles   =   {};
    for i = bbox(1,1):imagerows:bbox(2,1)
            for j = bbox(1,2):imagecolumns:bbox(2,2)


                 tiles{k}. rect= [i j i+imagerows   j+imagecolumns  ];

                 if (i+imagerows) > bbox(2,1)
                  tiles{k}. rect= [i j bbox(2,1)   j+imagecolumns  ];             
                 end

                 if (j+imagecolumns) > bbox(2,2)
                  tiles{k}. rect= [i j i+imagerows   bbox(2,2)  ];             
                 end


                 if (i+imagerows) > bbox(2,1) && (j+imagecolumns) > bbox(2,2) 
                  tiles{k}. rect= [i j bbox(2,1)   bbox(2,2)  ];             
                 end


                 tiles{k}.imagesize = imagesize;                    
                 k=k+1;              
            end
    end
