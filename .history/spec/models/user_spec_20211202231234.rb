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
  end
end
