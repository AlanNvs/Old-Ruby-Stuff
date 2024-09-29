# frozen_string_literal: true

def get_string
  gets.chomp
end

def dictionary
  %w[below down go going horn how howdy it i low own part partner
     sit]
end

def substrings(string, dictionary)
  substrings_matched = {}

  dictionary.each do |word|
    counter = 0
    split_string = string.split(' ')
    split_string.each do |sole_word|
      next unless sole_word.downcase.include?(word)

      word_sym = word.to_sym
      counter += 1
      substrings_matched[word_sym] = counter
    end
  end
  puts substrings_matched
end

def main
  substrings(get_string, dictionary)
end

main
