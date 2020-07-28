function samearray = neuralwork(FeaturesObject)
   samearray        = CombineALL(FeaturesObject);
   net              = createffnn(samearray);
   net              = trainnet(net,samearray);
   close all;
   datafeatures     = samearray.datafeatures';
   datarects        = samearray.datarects ;
   
   z  = size(datafeatures); 
   for j = 1:z(2)
       a =   datafeatures(1:end-1,j);
       b = sim(net,a);
       datarects(j,end)= b;
   end  
   
  
   datarects =  sortrows(datarects,5);
   
   datarectsTemp = [];
   z  = size(datarects); 
   for j = 1:z(1)
       datarectsTemp(j,:) = datarects(z(1) - j + 1,:);      
   end

   datarects = datarectsTemp;
   samearray.datarects = datarects;
   
   
   
   
   
   
   
   
   