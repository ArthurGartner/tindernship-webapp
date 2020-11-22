require 'rails_helper'

describe StudentsController, type: 'controller' do
    context '#edit' do
        describe 'student information is edited' do
            it 'responds to the edit route' do
                student = double('student', :id => 1, :firstName => "John", :lastName => "Doe", :graduationMonth => "June", :graduationYear => 2022, :bioText => "test",
                :locationPreference1 => "", :locationPreference2 => "", :locationPreference3 => "", :availability => "Full time", :resumeLink => "www.google.com")
                account = double('account', :accountId => 1)
                session = double('session', :accountid => 1)
                allow(Student).to receive(:find).and_return student
                allow(Account).to receive(:find).and_return account
                allow(Session).to receive(:find_by).and_return session
                get :edit, params: { id: 1 }
                expect(response).to render_template(:edit)
            end
            
            it 'does not allow other accounts to edit' do
                student = double('student', :id => 1, :firstName => "John", :lastName => "Doe", :graduationMonth => "June", :graduationYear => 2022, :bioText => "test",
                :locationPreference1 => "", :locationPreference2 => "", :locationPreference3 => "", :availability => "Full time", :resumeLink => "www.google.com")
                account = double('account', :accountId => 2, :username => "test")
                session = double('session', :accountid => 2)
                allow(Student).to receive(:find).and_return student
                allow(Account).to receive(:find).and_return account
                allow(Session).to receive(:find_by).and_return session
                get :edit, params: { id: 1 }
                expect(response).to redirect_to homepage_path
            end
            
            it 'assigns student to the template' do
                student = double('student', :id => 1, :firstName => "John", :lastName => "Doe", :graduationMonth => "June", :graduationYear => 2022, :bioText => "test",
                :locationPreference1 => "", :locationPreference2 => "", :locationPreference3 => "", :availability => "Full time", :resumeLink => "www.google.com")
                account = double('account', :accountId => 1)
                session = double('session', :accountid => 1)
                allow(Student).to receive(:find).and_return student
                allow(Account).to receive(:find).and_return account
                allow(Session).to receive(:find_by).and_return session
                get :edit, params: { id: 1 }
                expect(assigns(:student)).to eq student
            end
            
            months = []
            (1..12).each do |m|
              months << [Date::MONTHNAMES[m]]
            end
            
            it 'assigns months to the template' do
                student = double('student', :id => 1, :firstName => "John", :lastName => "Doe", :graduationMonth => "June", :graduationYear => 2022, :bioText => "test",
                :locationPreference1 => "", :locationPreference2 => "", :locationPreference3 => "", :availability => "Full time", :resumeLink => "www.google.com")
                account = double('account', :accountId => 1)
                session = double('session', :accountid => 1)
                allow(Student).to receive(:find).and_return student
                allow(Account).to receive(:find).and_return account
                allow(Session).to receive(:find_by).and_return session
                get :edit, params: { id: 1 }
                expect(assigns(:months)).to eq months
            end
            
            date = Date.today
            years = []
            (0..9).each do |y|
              years << [date.next_year(y).strftime("%Y")]
            end         
            
            it 'assigns years to the template' do
                student = double('student', :id => 1, :firstName => "John", :lastName => "Doe", :graduationMonth => "June", :graduationYear => 2022, :bioText => "test",
                :locationPreference1 => "", :locationPreference2 => "", :locationPreference3 => "", :availability => "Full time", :resumeLink => "www.google.com")
                account = double('account', :accountId => 1)
                session = double('session', :accountid => 1)
                allow(Student).to receive(:find).and_return student
                allow(Account).to receive(:find).and_return account
                allow(Session).to receive(:find_by).and_return session
                get :edit, params: { id: 1 }
                expect(assigns(:years)).to eq years
            end
        end
    end

    context '#show' do
        describe 'Student information is shown' do
            it 'Shows student information to authorized student' do
                student = double('student', :id => 1, :firstName => "John", :lastName => "Doe", :graduationMonth => "June", :graduationYear => 2022, :bioText => "test",
                :locationPreference1 => "", :locationPreference2 => "", :locationPreference3 => "", :availability => "Full time", :resumeLink => "www.google.com")
                account = double('account', :accountId => 1, :accountType => 0)
                session = double('session', :accountid => 1)
                allow(Student).to receive(:find).and_return student
                allow(Account).to receive(:find).and_return account
                allow(Session).to receive(:find_by).and_return session
                get :show, params: { id: 1 }
                expect(response).to render_template(:show) 
            end       
            
            it 'Assigns student to the template' do
                student = double('student', :id => 1, :firstName => "John", :lastName => "Doe", :graduationMonth => "June", :graduationYear => 2022, :bioText => "test",
                :locationPreference1 => "", :locationPreference2 => "", :locationPreference3 => "", :availability => "Full time", :resumeLink => "www.google.com")
                account = double('account', :accountId => 1, :accountType => 0)
                session = double('session', :accountid => 1)
                allow(Student).to receive(:find).and_return student
                allow(Account).to receive(:find).and_return account
                allow(Session).to receive(:find_by).and_return session
                get :show, params: { id: 1 }
                expect(assigns(:student)).to eq student
            end
        end
        
        describe 'Student information is not shown' do
            it 'Does not show student information to other students' do
                student = double('student', :id => 1, :firstName => "John", :lastName => "Doe", :graduationMonth => "June", :graduationYear => 2022, :bioText => "test",
                :locationPreference1 => "", :locationPreference2 => "", :locationPreference3 => "", :availability => "Full time", :resumeLink => "www.google.com")
                account = double('account', :accountId => 2, :username => "test", :accountType => 0)
                session = double('session', :accountid => 2)
                allow(Student).to receive(:find).and_return student
                allow(Account).to receive(:find).and_return account
                allow(Session).to receive(:find_by).and_return session
                get :show, params: { id: 1 }
                expect(response).to redirect_to homepage_path           
            end
        end
    end
end