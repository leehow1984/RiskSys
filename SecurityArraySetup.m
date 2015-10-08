     function SecurityArray = SecurityArraySetup(CellMat)
          
     
          SecurityArray = SecurityObj.empty(size(CellMat,1),0);
          
          for i = 1:size(CellMat,1)
              SecurityArray(i) = SecurityObj(CellMat{i,1},CellMat{i,2},CellMat{i,3},CellMat{i,4},CellMat{i,5},CellMat{i,6},CellMat{i,7},CellMat{i,8},CellMat{i,9},CellMat{i,10},CellMat{i,11},CellMat{i,12},CellMat{i,13});
          end 
     end