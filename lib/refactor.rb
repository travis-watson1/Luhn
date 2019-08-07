module Luhn
    def self.is_valid?(number)
        # Break the credit card into single digits
        single_digit_array = number.to_s.each_char.map{ |x| x.to_i }
        
        #Start from right, double every second digit)
        double_every_second_digit(single_digit_array)
        
        # If doubled value is greater than or equal to 10, subtract 9 from the value
        greater_than_ten_subtract(single_digit_array)
              
        # If sum is divisible by 10, its valid...otherwise it's not.
        single_digit_array.sum % 10 === 0 ? true : false
    end

    def double_every_second_digit(arr)
        arr.each_with_index do |num, index|
            if arr.length.even?
                if index.even? || index == 0
                    arr[index] = num * 2
                end
            end
            if arr.length.odd?
                if index.odd?
                    arr[index] = num * 2
                end
            end
        end
    end

    def greater_than_ten_subtract(arr)
        arr.each_with_index do |x, idx|
            if x >= 10
                arr[idx] = x - 9
            end
        end
    end
end

