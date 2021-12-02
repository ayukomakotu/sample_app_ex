require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validation' do
    before do
      @user = User.new(name: "Example User", 
                       email: "user@example.com",
                       password: "foobar", 
                       password_confirmation: "foobar")
    end

    it  '有効なuser' do
      expect(@user.valid?).to eq true
    end

    it 'passwordが空だと無効' do
      @user.name = "    "
      expect(@user.valid?).to eq false
    end

    it 'emailが空だと無効' do
      @user.email = "    "
      expect(@user.valid?).to eq false
    end

    it 'nameは50文字まで有効' do
      @user.name = "a" * 51
      expect(@user.valid?).to eq false
    end

    it 'emailは250文字まで有効' do
      @user.email = "a" * 244 + "@example.com"
      expect(@user.valid?).to eq false
    end

    it '有効なemailのフォーマット' do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user.valid?).to eq true
        expect(@user.errors[:email]).to include("#{valid_address.inspect} should be valid")
      end
    end
  end
end
