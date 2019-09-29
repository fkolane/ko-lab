module InsurancesHelper

    def insurance(id)
        
        insurance = Insurance.find(id)
        if insurance
            insurance
        end
      
    end
end
