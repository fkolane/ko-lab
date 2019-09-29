module PrestationTypesHelper
    def prestation_type(id)
        prestation_type = PrestationType.find(id)
        
        if prestation_type
            prestation_type
        end
    end
end
