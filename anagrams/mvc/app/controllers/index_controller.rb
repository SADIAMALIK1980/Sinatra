get '/' do
  erb :index
end

def valid_input?(input)
    if input.length < 2 
      raise Exception.new("Please enter a word!")
end
end 


get '/anagrams/:word' do
  @word = params[:word]
  alphabetized_string = @word.chars.sort.join
  @anagrams = Word.where("letters=?", alphabetized_string)
  @anagrams = @anagrams.uniq
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

