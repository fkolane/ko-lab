module ReceiptsHelper
    def receipt(id)
        
        receipt = Receipt.find(id)
        if receipt
            receipt
        end
      
    end
end
