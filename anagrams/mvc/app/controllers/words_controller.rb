get '/dictionary/' do
  @word = Word.all
    erb :"/dictionary/index"
  end

get '/dictionary/new' do
     @word = Word.new
    erb :"/dictionary/new"
  end

 post '/dictionary/' do
    @word = Word.create(text: params[:text])
   @word.errors
if @word.valid?
   @word.save
    redirect "/dictionary/#{@word.id}"
    else
     @errors = ''
     @word.errors.full_messages.each do |message|
      @errors = "#{@errors} #{message}.\n"
    end
erb :"/dictionary/new" 
end
  end

get '/dictionary/:id' do
    @word = Word.find(params[:id]) 
   erb :"/dictionary/show"
end

get '/dictionary/:id/edit' do
    @word = Word.find(params[:id])
    erb :'/dictionary/edit'
end

put '/dictionary/:id' do
    @word = Word.find(params[:id])
    @word.text = params[:text]
        if @word.valid?
    @word.save
    redirect "/dictionary/#{@word.id}"
  else
     @word.errors.full_messages.each do |message|
      @errors = "#{@errors} #{message}.\n"
    end
      erb :"/dictionary/show"
    end 
  end

delete '/dictionary/:id' do
  word = Word.find(params[:id])
  word.delete
  @error = "The word has been deleted from our database."
  redirect "/dictionary/"
  
end

