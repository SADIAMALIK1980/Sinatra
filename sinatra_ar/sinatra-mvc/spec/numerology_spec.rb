require 'spec_helper'

describe 'Our Numerology App' do
  include SpecHelper

  it "responds with success when we pass a birthday" do
    get '/04211999'
    # This is an HTTP status - we'll talk about these later!
    expect(last_response).to be_ok
  end

  it "has a layout" do
    get '/07041774'
    expect(last_response.body).to include("<title>Numerology App</title>")
  end

  it "has message in a paragraph" do
    get '/01012000'
    expect(last_response.body).to include("Your numerology number is")
  end    

  it 'responds to a get request to message/:birth_path_num' do
    get '/message/7'
    expect(last_response).to be_ok
  end

  it "responds to a post to / with a redirect" do
    # This test just checks that a post request is 
    # accepted with a birthdate parameter
    post("/", { mydob: '09031994' })
    expect(last_response.redirect?).to eq(true)
  end

  it "has a form" do
    get '/'
    expect(last_response.body).to include("<form ")
  end

  it "responds with success when we pass a birthday" do
    get '/04211999'
    # This is an HTTP status - we'll talk about these later!
    expect(last_response).to be_ok
  end

  SpecHelper::NUMEROLOGY.each do |number, details|
    it "returns the correct number for #{number}" do
      get("/#{details[:mydob]}")
      expect(last_response.body).to match(/#{details[:birth_path_number]}/)
    end
  end

  it "displays an error message if the input is too short" do
    mydob = '090319'
    post("/", { mydob: mydob })
    expect(last_response).to match(/#{'You should enter a valid birthdate in the form of mmddyyyy.'}/)
  end

  it "displays an error message if the input is non-numeric" do
    mydob = '12axy3jk'
    post("/", { mydob: mydob })
    expect(last_response).to match(/#{'You should enter a valid birthdate in the form of mmddyyyy.'}/)
  end  
    
end

