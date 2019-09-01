require 'rails_helper'

RSpec.describe Api::V1::NotebooksController, type: :controller do
  let(:notebook) { FactoryBot.create(:notebook, name: 'Tester1')}
  describe "GET #index" do
    before do
      get :index, :format => :json
    end
    it "returns http success" do
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST notebook#create" do
    it "should create notebook " do
      expect {
          post :create, params: {notebook: {name: 'test'}, :format=> JSON}
        }.to change(Notebook, :count).by(1)
    end
  end

  describe "PUT 'update/:id'" do
    it "allows an notebook to be updated" do
      newnotebook = FactoryBot.create(:notebook, name: 'Tester2')
      put :update, params: {id: newnotebook.id, :notebook => newnotebook.attributes = { :name => "new name" }}, :format => JSON
      response.should be_successful
    end
  end

  describe "DELETE notebook#destroy" do
    it "should destroy notebook and return 200" do
      notebook1 = FactoryBot.create(:notebook, name: 'Tester2')
      expect {
        delete :destroy, params: {id: notebook1.id}, :format => JSON
      }.to change(Notebook, :count).by(-1)
      expect(response.status).to eq 200
    end
  end

  describe "GET notebook#external_books" do
    before do
      get :external_books, :format => :json
    end
    it "should fetch data from api" do
      expect(response).to have_http_status(:success)
    end
  end


#notebook = Notebook.create! valid_attributes
  #    expect {
  #      delete :destroy, params: {id: notebook.to_param}, session: valid_session
  #    }.to change(Notebook, :count).by(-1)
  #  end

#  describe "GET #show" do
#    it "returns a success response" do
#      notebook = Notebook.create! valid_attributes
#      expect(response.content_type).to eq('application/json')
#      expect(response).to be_successful
#    end
#  end

#  describe "POST #create" do
#    context "with valid params" do
#      it "creates a new Notebook" do
#        expect {
#          post :create, params: {notebook: valid_attributes}, session: valid_session
#        }.to change(Notebook, :count).by(1)
#      end

#      it "renders a JSON response with the new notebook" do

 #       post :create, params: {notebook: valid_attributes}, session: valid_session
  #      expect(response).to have_http_status(:created)
  #      expect(response.content_type).to eq('application/json')
  #      expect(response.location).to eq(notebook_url(Notebook.last))
  #    end
  #  end

  #  context "with invalid params" do
  #    it "renders a JSON response with errors for the new notebook" do

   #     post :create, params: {notebook: invalid_attributes}, session: valid_session
   #     expect(response).to have_http_status(:unprocessable_entity)
   #     expect(response.content_type).to eq('application/json')
   #   end
   # end
  #end

  #describe "PUT #update" do
  #  context "with valid params" do
  #    let(:new_attributes) {
  #      skip("Add a hash of attributes valid for your model")
  #    }

  #    it "updates the requested notebook" do
  #      notebook = Notebook.create! valid_attributes
  #     put :update, params: {id: notebook.to_param, notebook: new_attributes}, session: valid_session
  #      notebook.reload
  #      skip("Add assertions for updated state")
  #    end

  #    it "renders a JSON response with the notebook" do
  #      notebook = Notebook.create! valid_attributes

  #      put :update, params: {id: notebook.to_param, notebook: valid_attributes}, session: valid_session
  #      expect(response).to have_http_status(:ok)
  #      expect(response.content_type).to eq('application/json')
  #    end
  #  end

  #  context "with invalid params" do
  #    it "renders a JSON response with errors for the notebook" do
  #      notebook = Notebook.create! valid_attributes

  #      put :update, params: {id: notebook.to_param, notebook: invalid_attributes}, session: valid_session
  #      expect(response).to have_http_status(:unprocessable_entity)
  #      expect(response.content_type).to eq('application/json')
  #    end
  #  end
  #end

  #describe "DELETE #destroy" do
  #  it "destroys the requested notebook" do
  #    notebook = Notebook.create! valid_attributes
  #    expect {
  #      delete :destroy, params: {id: notebook.to_param}, session: valid_session
  #    }.to change(Notebook, :count).by(-1)
  #  end
  #end

end
