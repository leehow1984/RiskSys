classdef SecurityObj
    %UNTITLED2 Summary of this class goes here
    %   Detailed explanation goes here
    
    properties
        SecurityName;
        SecurityID;
        Strategy;
        Bucket;
        AssetClass;
        InstrumentType;
        EffectiveCcy;
        LocalCCY;
        ModelCCY;
        PositionType;
        Yield; %++
        Duration; %++
        %OptionGreeks; %++
        %ShortTermBeta; % ++
        %LongTermBeta; % ++
        RiskModelSubID;
    end
    
    methods
        %/ obj constructor
         function obj = SecurityObj(SecurityName,SecurityID,Strategy,...
                                    Bucket,AssetClass,InstrumentType,...
                                    EffectiveCcy,LocalCCY,ModelCCY,...
                                    PositionType,Yield,Duration,RiskModelSubId)%,...
                                    %OptionGreeks, ShortTermBeta,LongTermBeta)
         
                  
                  obj.SecurityName = SecurityName;
                  obj.SecurityID = SecurityID;
                  obj.Strategy = Strategy;
                  obj.Bucket = Bucket;
                  obj.AssetClass = AssetClass; 
                  obj.InstrumentType = InstrumentType;
                  obj.EffectiveCcy = EffectiveCcy;
                  obj.LocalCCY = LocalCCY;
                  obj.ModelCCY = ModelCCY;
                  obj.PositionType = PositionType;
                  
                  if ~isempty(Yield)  
                     obj.Yield = str2mat(Yield);
                  end  
                  if ~isempty(Duration)
                    obj.Duration= str2mat(Duration);
                  end
                  obj.RiskModelSubID = RiskModelSubId;
                  %obj.OptionGreeks = OptionGreeks;
                  %obj.ShortTermBeta = ShortTermBeta;
                  %obj.LongTermBeta = LongTermBeta;
                 
         end
    end
    
end

