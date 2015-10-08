     function Result = test(obj)
           %/ find Unique Strategy List
           Holdings = [obj.Holdings];
           Security_List = [Holdings.Sec]; 
           Strategy_List = {Security_List.Strategy};
           Uniq_SList = unique(Strategy_List);
           
           
           %/ calculate return series for each strategy
           Weight_List = [Holdings.Weight];
           for i = 1:size(Uniq_SList,2)
               %/ for each strategy, find its weight array
               Weight_Array = zeros(size(Weight_List,1),size(Weight_List,2)); 
               Weight_Array(strcmp(Uniq_SList(1),Strategy_List) == 1) = Weight_List(strcmp(Uniq_SList(1),Strategy_List) == 1);
               
               
               %/ multiply weights
               
               
           end 
           
           
     end 
      
     
     function SecurityArray = SecurityArraySetup(CellMat)
          
     
          SecurityArray = SecurityObj.empty(size(CellMat,1),1);
          
          for i = 1:size(CellMat,1)
              SecurityArray(i,1).SecurityName = CellMat(i,1);
              SecurityArray(i,1).SecurityID = CellMat(i,2);
              SecurityArray(i,1).Strategy = CellMat(i,3);
              SecurityArray(i,1).Bucket = CellMat(i,4);
              SecurityArray(i,1).AssetClass = CellMat(i,5);
              SecurityArray(i,1).InstrumentType = CellMat(i,6);
              SecurityArray(i,1).EffectiveCcy = CellMat(i,7);
              SecurityArray(i,1).LocalCCY = CellMat(i,8);
              SecurityArray(i,1).ModelCCY = CellMat(i,9);
              SecurityArray(i,1).PositionType = CellMat(i,10);
              SecurityArray(i,1).Yield = CellMat(i,11);
              SecurityArray(i,1).Duration = CellMat(i,12);
          end 
     end