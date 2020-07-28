function b = GetTrain(a,b,Xpercent,XTrain)
                   A.X = reformulate(a.Train,1)   ;                 
                   A.Y = reformulate(a.Train,0)   ;

                   [b NumOfTrueTiles  AreaofTrueTiles RXShape] =  getX(b,A,Xpercent);
            
                   P = AreaofTrueTiles/ a.TrainArea ;
                   if(NumOfTrueTiles > 0 && P >= XTrain  )
                            b.RXShape               =  RXShape;
                            
                   end  
            
       
       
    
    function [b NumOfTrueTiles  AreaofTrueTiles RXShape]=getX(b,A,Xpercent)
        
                   NumOfTrueTiles      = 0;
                   AreaofTrueTiles     = 0;

                   RXShape = [];

               for k = 1:numel(b.FeaturesObject)
                 
                    
                    tilearea         =  b.FeaturesObject(k).area;
                   [trainX  RXaraea] =  GetIntersection(b.FeaturesObject(k),A);

                   if(~isempty(trainX) )
                           if( (RXaraea / tilearea) >= Xpercent )

                               NumOfTrueTiles                       = NumOfTrueTiles  + 1;
                               AreaofTrueTiles                      = AreaofTrueTiles + RXaraea ;

                               b.FeaturesObject(k).train            = 1;
                               RXShape                              = [RXShape;trainX];                      
                               b.FeaturesObject(k).RXaraea          = RXaraea;
                           elseif((RXaraea / tilearea) >= Xpercent/2)  
                                b.FeaturesObject(k).train            = 2; 
                                b.FeaturesObject(k).RXaraea          =  RXaraea;
                           elseif((RXaraea / tilearea) >= Xpercent/4)  
                                b.FeaturesObject(k).train            = 3; 
                                b.FeaturesObject(k).RXaraea          =  RXaraea;
                           else
                                b.FeaturesObject(k).train            = 4;                      
                                b.FeaturesObject(k).RXaraea          = 4;                           
                           end
                       
                   else 
                       b.FeaturesObject(k).train            = 0;                      
                       b.FeaturesObject(k).RXaraea          = 0;
                      
                   end

               end