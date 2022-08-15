require 'pry-byebug'

def caesar(string_to_encode, shift_factor)
  #account for looping shift factor
  if shift_factor > 26 || shift_factor < -26
    shift_factor = shift_factor.remainder(26)
  end
  #iterate of each char in string
  ciphered = ""
  string_to_encode.each_char do |char|  
  #convert number to int
    ascii = char.ord
      #if_char is lowercase letter
      if ascii >= 97 && ascii <= 122
        shifted_char = shift_ascii(97, 122, ascii, shift_factor)
      #same with upper
      elsif ascii >= 65 && ascii <= 90
        #add shift factor,  if_goes over bounds keep in bounds
        shifted_char = shift_ascii(65, 90, ascii, shift_factor)
      else
        shifted_char = ascii
      end
    ciphered += shifted_char.chr 
  end
  puts ciphered
end






def shift_ascii (lower_bound, higher_bound, ascii, shift_factor)
  #add shift factor if goes over bounds keep in bounds
  shifted_char = ascii + shift_factor
  #account for outside bounds
  if shifted_char > higher_bound 
    shifted_char = lower_bound + higher_bound - shifted_char - 1
  elsif shifted_char < lower_bound
    shifted_char = higher_bound + (shifted_char - lower_bound) + 1
  end
  shifted_char
end


#get user input
puts "enter a message you would like to enconde"
message = gets.chomp
shift_factor = nil
loop do
  puts "enter a number(integer) to encode by"
  shift_factor = gets.chomp.to_i
  if shift_factor != 0
    break
  end
end





caesar(message, shift_factor)

