module Luhn
    def self.is_valid?(number)

        single_digit_array = number.to_s.each_char.map{ |x| x.to_i }

        double_every_second_digit(single_digit_array)

        greater_than_ten_subtract(single_digit_array)
        
        single_digit_array.sum % 10 === 0 ? true : false
    end

    def self.double_every_second_digit(arr)
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

    def self.greater_than_ten_subtract(arr)
        arr.each_with_index do |x, idx|
            if x >= 10
                arr[idx] = x - 9
            end
        end
    end
end




