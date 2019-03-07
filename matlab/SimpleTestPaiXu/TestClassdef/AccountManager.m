classdef AccountManager
    methods(Static)
        function assignStatus(BA)
            if BA.AccountBalance<0
                if BA.AccountBalance<-200
                    BA.AcountBalance='closed';
                else
                    BA.AccountBalance='overdrawn';
                end
            end
        end
        
        
        function addAccount(BA)
            addlistener(BA,'InsufficientFunds',...
                @(src,evnt)AccountManager.assignStatues(src));
        end
    end
end