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
    if input.length > 3  or distinct_letters?(input) == false
      raise Exception.new("The word should be three letter or less. No repeated letters!")
end
end 

get '/anagrams/:word' do
  @word = params[:word]
  alphabetized_string = @word.chars.sort.join
  @anagrams = Word.where("letters=?", alphabetized_string)
  erb :show
end

post '/' do
  @word = params[:word]
	begin 
		valid_input?(@word)
  		redirect "/anagrams/#{@word}"
 	rescue Exception => error
      	@error = error.message 
		erb :index
    end
end