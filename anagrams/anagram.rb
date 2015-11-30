require_relative 'reverse_letters'

def find_anagram(letters)
   length = letters.length
   letters = letters.split("")

   anagrams = []

   letters.each_with_index do |letter, index|
     remaining_letters = letters.select {|l| l != letter}
     anagrams << letter + remaining_letters.join

     anagrams << letter + reverse_letters(remaining_letters).join
   end
   anagrams
 end