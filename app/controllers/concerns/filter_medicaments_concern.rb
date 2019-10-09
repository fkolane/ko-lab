module FilterMedicamentsConcern
    include ActiveSupport::Concern 

    def get_medicaments
        @medicaments = Medicament.where(medicament_family_id: params[:data])
        @medicaments = @medicaments.map{|a| [a.name, a.id ]}.insert(0, "Sélectionner")
        
    end
end