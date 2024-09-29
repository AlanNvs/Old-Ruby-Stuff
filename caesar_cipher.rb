# frozen_string_literal: true

def get_string
  gets.chomp
end

def get_shift_factor
  gets.chomp.to_i
end

def transform_string
  string = get_string
  shift_factor = get_shift_factor
  encoded_word = ''

  string.each_byte do |char|
    encoded_char = char + shift_factor

    if char <= 90 && char >= 65
      encoded_char -= 26 if encoded_char > 90
    elsif char <= 122 && char >= 97
      encoded_char -= 26 if encoded_char > 122
    else
      encoded_char = char
    end
    encoded_word += encoded_char.chr
  end
  puts encoded_word
end

transform_string
