get '/people/' do
   @people = Person.all
  erb :"/people/index"
end

get '/people/new' do
    @person = Person.new
    erb :"/people/new"
end 

post '/people' do
  if params[:birthdate].include?("-")
    birthdate = params[:birthdate]
  elsif birthdate
    birthdate = Date.strptime(params[:birthdate], "%m%d%Y")
else
  		birthdate = ""
end

  @person = Person.new(first_name: params[:first_name], last_name: params[:last_name], birthdate: birthdate)
    if @person.valid?
      @person.save
      redirect "/people/#{@person.id}"
    else
     @errors = ''
     @person.errors.full_messages.each do |message|
      @errors = "#{@errors} #{message}.\n"
    end
erb :"/people/new" 
end
end

get '/people/:id/edit' do
    @person = Person.find(params[:id])
    erb :'/people/edit'
end

put '/people/:id' do
    @person = Person.find(params[:id])
    @person.first_name = params[:first_name]
    @person.last_name = params[:last_name]
    @person.birthdate = params[:birthdate]
     if @person.valid?
    @person.save
    redirect "/people/#{@person.id}"
  else
     @person.errors.full_messages.each do |message|
      @errors = "#{@errors} #{message}.\n"
    end
      erb :"/people/edit"
    end 
  end

delete '/people/:id' do
  person = Person.find(params[:id])
  person.delete
  @error = "The person has been deleted from our database."
  redirect "/people"
  
end

get '/people/:id' do
    @person = Person.find(params[:id])
    @birth_path_num = Person.dob_pathnumber(@person.birthdate.strftime("%m%d%Y"))
    @message = Person.dob_message(@birth_path_num)  
   erb :"/people/show"
end