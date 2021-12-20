require "rails_helper"

RSpec.describe AuthorizationController, type: :controller do
  describe "GET #new" do
    it "renders the new template" do
       get :new
       expect(response).to render_template("new")
     end
     it "returns a 200" do
       get :new
       expect(response).to have_http_status(:ok)
     end
  end
end
