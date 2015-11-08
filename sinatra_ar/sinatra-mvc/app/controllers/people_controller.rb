get '/people/' do
   @people = Person.all
  erb :"/people/index"
end

get '/people/:id' do
    @person = Person.find(params[:id])
    birthdate_string = @person.birthdate.strftime("%m%d%Y")
    @birth_path_num = Person.dob_pathnumber(birthdate_string)
    @message = Person.dob_message(@birth_path_num)  
   erb :"/people/show"
end