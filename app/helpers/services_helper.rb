module ServicesHelper
    def service(id) 
        service = Service.find(id)
        if service
            service
        end
    end
end
