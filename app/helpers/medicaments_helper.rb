module MedicamentsHelper
    def medicament(id)
        
        medicament = Medicament.find(id)
        if medicament
            medicament
        end
      
    end

end
