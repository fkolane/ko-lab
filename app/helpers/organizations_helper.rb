module OrganizationsHelper

    def organization 
        organization = Organization.take
        if organization
            organization
        end
    end
end
