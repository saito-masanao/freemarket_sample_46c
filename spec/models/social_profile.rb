require 'rails_helper'

describe SocialProfile do
  describe '#create' do
    before do
      @user = create(:user)
    end
    it "uidの値が重複していてもproviderの値が異なれば登録できる" do
      social_profile = create(:social_profile,user_id:@user.id)
      another_social_profile = build(:social_profile,provider:"1224",user_id:@user.id)
      expect(another_social_profile).to be_valid
    end

    it "外部キーの参照元レコードがなかったら登録できない" do
      social_profile = build(:social_profile,user_id:100)
      social_profile.valid?
      expect(social_profile.errors[:user][0]).to include("must exist")
    end

    it "外部キーの参照元レコードがあれば登録できる" do
      social_profile = build(:social_profile,user_id:@user.id)
      expect(social_profile).to be_valid
    end

    it "userが削除されたら連携するsocial_profileも削除される" do
      social_profile = create(:social_profile,user_id:@user.id)
      expect{ @user.destroy }.to change{ SocialProfile.count }.by(-1)
    end
  end
end
