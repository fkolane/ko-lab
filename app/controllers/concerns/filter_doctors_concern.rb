module FilterDoctorsConcern
    include ActiveSupport::Concern 

    def get_doctors
        puts "Les paramètres:#{params[:data]}"
        @users = User.where(service_id: params[:data])
        @doctors = []
  
        @users.map do |user| 
        
          if user.profile
            @doctors.push(user.profile)
          end
        end
  
    
        @doctors = @doctors.map{|a| ["#{a.first_name} #{a.last_name}", a.user_id ]}.insert(0, "Sélectionner")
        
    end

end