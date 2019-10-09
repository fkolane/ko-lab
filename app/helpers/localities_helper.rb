module LocalitiesHelper
    def locality(id)
        Locality.find(id)
    end
end
