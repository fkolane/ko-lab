module InsuranceTypesHelper

    def insurance_type(id)
        insurance_type = InsuranceType.find(id)
        
        if insurance_type
            insurance_type
        end
    end
end
