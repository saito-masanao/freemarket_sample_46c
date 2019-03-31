require 'rails_helper'

describe ItemsController, type: :controller do
  describe 'GET #top' do
    let(:user) {create(:user)}
    let(:category) {create(:category)}
    let(:brand) {create(:brand)}
    it "renders the :top template" do
      get :top
      expect(response).to render_template :top
    end

    # it "populates an array of items ordered " do
    #   items = create(:item,brand_id: brand.id,category_id: category.id,user_id: user.id)
    #   get :top
    #   expect(assigns(:items)).to match(items)
    # end
  end
end
