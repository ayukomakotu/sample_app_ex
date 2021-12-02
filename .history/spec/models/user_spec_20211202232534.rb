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
  end
end
