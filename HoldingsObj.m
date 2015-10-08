classdef HoldingsObj
    %/ My holdings Object
    
    properties
       Sec;
       Weight;
    end
    
    methods
        %/ obj constructorL load securities into holding obj
        function obj = HoldingsObj(Security_Array, Weight_Array) 
           %/ validate input 
           if nargin > 0 % nargin returns the number of input arguments passed in the call to the currently executing function
             %/ validate data input
               %/
               %/
               %/
               
               
             %/ load data into the object 
             obj = HoldingsObj.empty(size(Security_Array,2),0);
             
             for i = 1:size(Security_Array,2)
                obj(i).Sec = Security_Array(i);
                obj(i).Weight = Weight_Array(i);
             end
           end
        end    
    end
    
end

