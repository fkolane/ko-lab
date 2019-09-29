module AllergyCategoriesHelper
    def allergy_category(id)
        allergy_category = AllergyCategory.find(id)
        
        if allergy_category
            allergy_category
        end
    end
end
