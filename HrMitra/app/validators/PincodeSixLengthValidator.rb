class PincodeSixLengthValidator < ActiveModel::EachValidator
    def validate_each(record,attribute,value)
        if value != nil
            length = value.digits.length
            if length !=6
                record.errors.add(attribute,message: "must be of length 6.")
            end
        end
    end
end