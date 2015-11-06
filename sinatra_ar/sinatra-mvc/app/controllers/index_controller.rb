#require 'sinatra'

get '/:mydob' do
  setup_index_view
end

get '/message/:birth_path_num' do
@birth_path_num = params[:birth_path_num].to_i
@message = Person.dob_message(@birth_path_num)
erb :index
end

get '/' do
 erb :form
end


post '/' do
mydob = params[:mydob].gsub("-","")
if Person.valid_birthdate(mydob)
     birth_path_num = Person.dob_pathnumber(mydob)
redirect "/message/#{birth_path_num}"
    else
      @error = "You should enter a valid birthdate in the form of mmddyyyy." 
      erb :form 
      
    end
end

def setup_index_view
  mydob = params[:mydob]
  birth_path_num = Person.dob_pathnumber(mydob)
  @message = Person.dob_message(@birth_path_num)
erb :index
end


get '/newpage' do
  erb :newpage
end
