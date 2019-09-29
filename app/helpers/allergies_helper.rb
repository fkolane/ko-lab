module AllergiesHelper
    def allergy(id)
        allergy = Allergy.find(id)
        
        if allergy
            allergy
        end
    end
end
