class PincodeSixLengthValidator < ActiveModel::EachValidator
    def validate_each(record,attribute,value)
        length = value.digits.length
        if length !=6
            record.errors.add(attribute, :blank,message: "must be of length 6.")
        end
    end
end