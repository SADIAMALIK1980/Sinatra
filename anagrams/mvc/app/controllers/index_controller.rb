get '/' do
  erb :index
end

def three_letters?(input)
    # return true if input is 3 or less characters
    # and false otherwise
	if input.length <= 3 
		true
	else
		false
	end
end

def distinct_letters?(input)
   letter_array = input.chars
   unique_letters = letter_array.uniq
	if unique_letters.length < letter_array.length
     		false
   	else
     		true
   	end
end

def valid_input?(input)
    if three_letters?(input) && distinct_letters?(input)
      true
    else
      false
    end
end 

get '/anagrams/:word' do
  @word = params[:word]
  @anagrams = Word.find_anagrams(@word)
  erb :show
end

post '/' do
  @word = params[:word]
if valid_input?(@word)
  redirect "/anagrams/#{@word}"
else
  # create an @error variable with an error message
  # then render the index page again
    @error = "The word should be three letter or less. No repeated letters!"
erb :index
    end
end