require 'rails_helper'

RSpec.describe AdminUser, type: :model do
  describe 'AdminUser.create' do
    let(:admin_user) { FactoryBot.create(:admin_user) }

    it '管理者アカウントが作成される' do
      expect(admin_user).to be_persisted
      expect(admin_user.valid_password?('password')).to be_truthy
    end

    it 'メールアドレスが重複しているため作成できない' do
      invalid_admin_user = FactoryBot.build(:admin_user, email: admin_user.email)
      expect(invalid_admin_user.save).to be_falsey
    end
  end
end
