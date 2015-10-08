classdef CovMatrixObj

    
    properties
        Matrix;
        ID_List;
        Cor_Matrix;
    end
    
    methods
        %/ constructor 
        function obj = CovMatrixObj(Matrix, ID_List)
            %/ validate input
            if ~ismatrix(Matrix)
               error('Matrix input needs to be a matrix');
            end 
            if ~iscell(ID_List)
               error('ID_List input needs to be a cell');
            end             
            if size(Matrix,1) ~= size(Matrix,2) 
               error('Matrix needs to be a retangular matrix');   
            end     
            if size(Matrix,1) ~= size(ID_List,2) 
               error('Matrix needs to have the same size as ID_List');   
            end     
            
            obj.Matrix = Matrix;
            obj.ID_List = ID_List;

        end
        
        %/ ID index search function
        function Result = ID_Index_Finder(obj,ID)
            Result = find(strcmp(ID, obj.ID_List));
        end

    end
    
end

