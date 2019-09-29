module PrestationsHelper
    def prestation(id)
        
        prestation = Prestation.find(id)
        if prestation
            prestation
        end
      
    end
end
