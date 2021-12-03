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
      expect(@user).to be_valid
    end

    it 'passwordが空だと無効になるか' do
      @user.name = "    "
      expect(@user).to be_invalid
    end

    it 'emailが空だと無効になるか' do
      @user.email = "    "
      expect(@user).to be_invalid
    end

    it 'nameは50文字まで有効になっているか' do
      @user.name = "a" * 51
      expect(@user).to be_invalid
    end

    it 'emailは250文字まで有効になるか' do
      @user.email = "a" * 244 + "@example.com"
      expect(@user).to be_invalid
    end

    it '有効なemailのフォーマット' do
      valid_addresses = %w[user@example.com USER@foo.COM A_US-ER@foo.bar.org
                         first.last@foo.jp alice+bob@baz.cn]
      valid_addresses.each do |valid_address|
        @user.email = valid_address
        expect(@user).to be_valid
        #失敗した時のメッセージをチェックするexampleはどう書いたらいい？
      end
    end

    it "emailの一意性が担保されているか" do
      duplicate_user = User.new(name: "test email unique", 
                              email: "user@example.com",
                              password: "foobar", 
                              password_confirmation: "foobar")
      @user.save
      expect(duplicate_user).to be_invalid
    end

    it "nameの一意性が担保されているか" do
      duplicate_user = User.new(name: "Example User", 
                              email: "test_name_unique@example.com",
                              password: "foobar", 
                              password_confirmation: "foobar")
      @user.save
      expect(duplicate_user).to be_invalid
    end

    it "passwordが空白の場合無効になるか" do
      @user.password = @user.password_confirmation = " " * 6
      expect(@user).to be_invalid
    end

    it "passwordが短すぎる場合無効になるか" do
      @user.password = @user.password_confirmation = "a" * 5
      expect(@user).to be_invalid
    end

    it "remember_digestがnilの場合、authenticated?はfalseを返しているか" do
      expect(@user.authenticated?(:remember, '')).to eq false
    end

    it "userが削除された時、micropostも削除されるか" do
      @user.save
      @user.microposts.create!(content: "Lorem ipsum")
      expect{@user.destroy}.to change{Micropost.count}.by(-1)
    end

    
  end
end
