function b  = GetTest(a,b,Xpercent)
                   A.X = reformulate(a.Test,1)   ;                 
                   A.Y = reformulate(a.Test,0)   ;

                   [b  TXShape] =  getX(b,A,Xpercent);
                   b.TXShape               =  TXShape; 
            
       
    
    function [b  TXShape]=getX(b,A,Xpercent)
               TXShape = [];
               for k = 1:numel(b.FeaturesObject)  
                    tilearea         =  b.FeaturesObject(k).area;
                   [testX  TXaraea] =  GetIntersection(b.FeaturesObject(k),A);

                   if(~isempty(testX) )
                       if( (TXaraea / tilearea) >= Xpercent )
                           b.FeaturesObject(k).test             = 1;
                           TXShape                              = [TXShape;testX];                      
                           b.FeaturesObject(k).TXaraea          = TXaraea;
                       else
                            b.FeaturesObject(k).test            = 0;                      
                            b.FeaturesObject(k).TXaraea         = 0;                           
                       end
                       
                   else 
                       b.FeaturesObject(k).test            = 0;                      
                       b.FeaturesObject(k).TXaraea          = 0;
                      
                   end

              end