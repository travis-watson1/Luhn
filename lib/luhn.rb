module Luhn
    def self.is_valid?(number)
        # Break the credit card into single digits
        single_digit_array = number.to_s.each_char.map{ |x| x.to_i }

        
        #Start from right, double every second digit)
        single_digit_array.each_with_index do |num, index|
            if single_digit_array.length.even?
                if index.even? || index == 0
                    single_digit_array[index] = num * 2
                end
            end
            if single_digit_array.length.odd?
                if index.odd?
                    single_digit_array[index] = num * 2
                end
            end
        end

        # If doubled value is greater than or equal to 10, subtract 9 from the value
        single_digit_array.each_with_index do |x, idx|
            if x >= 10
                single_digit_array[idx] = x - 9
            end
        end
              
        # If sum is divisible by 10, its valid...otherwise it's not.
        single_digit_array.sum % 10 === 0 ? true : false
    end

    
end



