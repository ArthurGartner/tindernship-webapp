
describe LoginController, type: 'controller' do
    context '#post_register' do
        describe 'new student has profile and account' do
            it 'responds to the edit_student_path route' do
                student = double('student')
                account = double('account')
                allow(Student).to receive(:create).and_return student
                allow(Account).to receive(:create).and_return account
                get :edit_student_path, {id: 1}
                expect(response).to render_template(:edit_student_path)
            end
        end
    end
end
