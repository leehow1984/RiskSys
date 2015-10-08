classdef PortfolioObj
    %/ portfolio object
    %/ 
    
    
    properties
        Holdings;
        MarketData;
        RiskAnalytics;
        NAV;
    end
    
    methods
        
        %/ check holding class and marketdata class 
        function obj = PortfolioObj(HoldingsObj)%,MarketData,RiskModel)
             obj.Holdings = HoldingsObj;
        end 
    end
    
end

