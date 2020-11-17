require 'rails_helper'

describe LoginController, type: 'controller' do
    context 'index' do

    end
    
    context '#post_register' do
       describe 'student with duplicate username' do
           it 'should not be created' do
               student = double('student', :id => 1, :firstName => "John", :lastName => "Doe", :graduationMonth => "June", :graduationYear => 2022, :bioText => "test",
                :locationPreference1 => "", :locationPreference2 => "", :locationPreference3 => "", :availability => "Full time", :resumeLink => "www.google.com")
               jsonMessage = "has already been created."
               allow(Account).to receive(:where).and_return student
               post :post_register, params: {username: "johndoe@citadel.edu", password: "thisIsAValidPassword"}
               expect(response.body).to include(jsonMessage)
           end           
       end
    end
end
