module UsersHelper
    def doctor_info(id)
        doctor = User.find(id)
        if doctor.profile
            doctor.profile
        end
       
    end
end