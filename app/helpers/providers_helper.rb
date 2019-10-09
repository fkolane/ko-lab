module ProvidersHelper
    def provider(id)
        Provider.find(id)
    end
end
