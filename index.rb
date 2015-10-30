require 'sinatra'

def dob_pathnumber(my_dob)

number = my_dob[0].to_i + my_dob[1].to_i + my_dob[2].to_i + my_dob[3].to_i + my_dob[4].to_i + my_dob[5].to_i + my_dob[6].to_i

number = number.to_s

number = number[0].to_i + number[1].to_i

if (number > 9)

number = number.to_s
number = number[0].to_i + number[1].to_i
end

return number
end

def dob_message(birth_path_num)

message = case birth_path_num
when 1
    "\nOne is the leader. The number one indicates the ability to stand alone, and is a strong vibration. Ruled by the Sun."
when 2
    "\nThis is the mediator and peace-lover. The number two indicates the desire for harmony. It is a gentle, considerate, and sensitive vibration. Ruled by the Moon."
when 3
    "\nNumber Three is a sociable, friendly, and outgoing vibration. Kind, positive, and optimistic, Three's enjoy life and have a good sense of humor. Ruled by Jupiter."
when 4
    "\nThis is the worker. Practical, with a love of detail, Fours are trustworthy, hard-working, and helpful. Ruled by Uranus."
when 5
    "\nThis is the freedom lover. The number five is an intellectual vibration. These are 'idea' people with a love of variety and the ability to adapt to most situations. Ruled by Mercury."
when 6
    "\nThis is the peace lover. The number six is a loving, stable, and harmonious vibration. Ruled by Venus."
when 7
    "\nThis is the deep thinker. The number seven is a spiritual vibration. These people are not very attached to material things, are introspective, and generally quiet. Ruled by Neptune."
when 8
    "\nThis is the manager. Number Eight is a strong, successful, and material vibration. Ruled by Saturn."
when 9
    "\nThis is the teacher. Number Nine is a tolerant, somewhat impractical, and sympathetic vibration. Ruled by Mars."
end
end


def setup_index_view
  my_dob = params[:mydob].gsub("-","")
  @birth_path_num = dob_pathnumber(my_dob)
  @message = dob_message(@birth_path_num)
erb :index
end

get '/' do
 erb :form
end

def valid_birthdate(input)
  if (input.length == 8 && !input.match(/^[0-9]+[0-9]$/).nil?)
    true
  else false
end
  end

post '/' do
mydob = params[:mydob].gsub("-","")
birth_path_num = dob_pathnumber(mydob)
redirect "/message/#{birth_path_num}"
end

get '/message/:birth_path_num' do
@birth_path_num = params[:birth_path_num].to_i
@message = dob_message(@birth_path_num)
erb :index
end

get '/newpage' do
  erb :newpage
end
