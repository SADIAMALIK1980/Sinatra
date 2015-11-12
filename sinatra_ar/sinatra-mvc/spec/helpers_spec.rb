require 'spec_helper'

describe 'Our Helper' do
  include SpecHelper
  include ApplicationHelper
  
  before (:all) do
    @new_person = Person.new
    @person = Person.create(first_name: "Sample", last_name: "Person", birthdate: (DateTime.now - 25.years))
  end
  
  after (:all) do
    @person.delete
  end  
  
  it 'gets the proper form action for a new person' do
    expect(people_form_action(@new_person)).to eq("/people")
  end
  
  it 'gets the proper form action when editing a person' do
    expect(people_form_action(@person)).to eq("/people/#{@person.id}")
  end
  
  it 'get the proper form method for a new person' do
    expect(people_form_method(@new_person)).to eq("post")
  end
  
  it 'get the proper form method when editing a person' do
    expect(people_form_method(@person)).to eq("put")
  end
  
  it 'get the proper form class for a new person' do
    expect(people_form_class(@new_person)).to eq("new-person")
  end
  
  it 'get the proper form class when editing a person' do
    expect(people_form_class(@person)).to eq("edit-person")
  end
  
  it 'get the proper form id for a new person' do
    expect(people_form_id(@new_person)).to eq("new-person")
  end
  
  it 'get the proper form id when editing a person' do
    expect(people_form_id(@person)).to eq("person-#{@person.id}")
  end  
  
end