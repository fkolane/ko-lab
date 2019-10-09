module EthnicGroupsHelper
    def ethnic_group(id)
        EthnicGroup.find(id)
    end
end
