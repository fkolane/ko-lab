module RolesHelper
    def role_name(id)
        if id.present?
            role = Role.find(id).name 
        end
    end
end
