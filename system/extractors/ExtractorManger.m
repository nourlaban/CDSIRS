function ExtractorManger(pathes,work,Duties,CurrentDuties)
    clc;     
    work.FeaturesRootPath    = [work.WorkPath ,work.subworkpath,work.features];
    mkdir(work.FeaturesRootPath); 
    Extractor(pathes,work,Duties,CurrentDuties);
    
   