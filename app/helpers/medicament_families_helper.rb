module MedicamentFamiliesHelper
    def medicament_family(id)
        medicament_family = MedicamentFamily.find(id)
        if medicament_family
            medicament_family
        end
    end
end
