classdef RiskEngineObj
    %UNTITLED4 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        CovMat;
        Portfolio;
        ReturnMatrix;
        ID_List;
        Strat_RetMat;
        Strat_List;
    end
    
    methods  (Access = public)
        %/ constructor
        function obj = RiskEngineObj(MarketReturnMatrix,ID_List,Portfolio)
            %/ validate data input
            if ~ismatrix(MarketReturnMatrix)
               error('MarketReturnMatrix needs to be a matrix ') 
            end    
            
            
            %/ load data
            obj.ReturnMatrix = MarketReturnMatrix;
            obj.Portfolio = Portfolio;
            obj.ID_List = ID_List;
            [obj.Strat_RetMat, obj.Strat_List] = obj.Strat_Ret_Calc();
            
        end
        
        %/ method: Calculate strategy correlation
        function Result = Cov_Calc(obj)
           Result = cov(obj.ReturnMatrix);
        end         
    
        %/ method: Calculate strategy correlation
        function CorrMat = Strat_Corr(obj)
               %/ Calculate Correlation of strategy return
               %/ pairwise correlation computation: ignore rows with NAN
               CorrMat = corrcoef(obj.Strat_RetMat,'rows','pairwise');
               CorrMat(isnan(CorrMat)==1) = 0;
        end 
        
        %/ method: calculate strategy principal component
        function StPCA = Strat_PCA(obj,CorrMat)
                 %/ run principal component analysis
                 [pc,score,latent,tsquare] = princomp(CorrMat);
                 %/ plot the result: 2x2 chart showing strategies
                 %/ commonalities in first 3 PC dimension
                 subplot(2,1,1)
                 biplot(score(:,1:2),'VarLabels',obj.Strat_List);
                 xlabel('PC1');
                 ylabel('PC2');
                 
                 subplot(2,1,2)
                 biplot(score(:,2:3),'VarLabels',obj.Strat_List)
                 xlabel('PC2');
                 ylabel('PC3');
                 
                 h = findobj(gcf, 'type', 'text');
                 set(h, 'FontSize', 8);
                 StPCA =  score; 
        end    
    end
    
    methods  (Access = private)
        %/ private method: calculate strategy return give weight in
        %/ portfolio object
        function [Strat_RetMat,Uniq_SList]  = Strat_Ret_Calc(obj) 
           Holdings = [obj.Portfolio.Holdings];
           %/ find security ID list
           %/ if security's RM sub ID is not empty then use RM SUBID
           %/ otherwise use security ID
           Sec_Array = [Holdings.Sec];
           SecuritySubID_List = {Sec_Array.RiskModelSubID}; 
           SecurityID_List = {Sec_Array.SecurityID}; 
           SecuritySubID_List(strcmp(SecuritySubID_List,'') == 1)= SecurityID_List(strcmp(SecuritySubID_List,'') == 1);
           Security_List = SecuritySubID_List;
           
           %/ find Unique Strategy List
           Strategy_List = {Sec_Array.Strategy};
           Uniq_SList = unique(Strategy_List);
           
           %/ pre-allocate strategy return matrix
           Strat_RetMat = zeros(size(obj.ReturnMatrix,1),size(Uniq_SList,2));
           
           %/ calculate return series for each strategy
           Weight_List = [Holdings.Weight];
           Weight_List(isnan(Weight_List)==1) = 0;
           
           for i = 1:size(Uniq_SList,2)
               %/ for each strategy, find its weight array
               if strcmp(Uniq_SList(i),'Cash') 
                  Strat_RetMat(:,i) = 0; 
               else    
                  %Weight_Array(strcmp(Uniq_SList(i),Strategy_List) == 1) = Weight_List(strcmp(Uniq_SList(i),Strategy_List) == 1);
                  %/ for each strategy, find its security ID list
                  Srat_SecID_List = Security_List(strcmp(Uniq_SList(i),Strategy_List) == 1);
                  Srat_SecID_loc = find(strcmp(Uniq_SList(i),Strategy_List));
                  %/ find its index in return matrix
                  %RetMat_LocIndex = zeros(size(obj.ReturnMatrix,2),1);
                  RetMat_Weight = zeros(size(obj.ReturnMatrix,2),1);
                  

                  for j = 1:size(Srat_SecID_List,2)
                      A = 0;
                      A = find(strcmpi(Srat_SecID_List(j),obj.ID_List));
                      if ~ isempty(A)
                         RetMat_Weight(A) = Weight_List(Srat_SecID_loc(j)) + RetMat_Weight(A); 
                      else
                         RetMat_Weight(j) = nan; 
                      end     
                  end
                  
                  %/ calculat strategy return
                  Strat_RetMat(:,i) = obj.ReturnMatrix(:,(RetMat_Weight~=0)) * RetMat_Weight(RetMat_Weight~=0); 
               end 
           end 
        end
    end
end

