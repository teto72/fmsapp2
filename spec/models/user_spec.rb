require 'rails_helper'

describe User do
  describe '#create' do

    # 1
    it "username,email,password,password_confirmationが存在すれば登録可能のこと" do
      user = build(:user)
      expect(user).to be_valid
    end
    # 2
    it "usernameがないと登録できないこと" do
      user = build(:user, username: "")
      user.valid?
      expect(user.errors[:username])
    end
    # 3
    it "emailがないと登録できないこと" do
      user = build(:user, email: "")
      user.valid?
      expect(user.errors[:email])
    end
    # 4
    it "passwordがないと登録できないこと" do
      user = build(:user, password: "")
      user.valid?
      expect(user.errors[:password])
    end
    # 5
    it "password_confirmationがないと登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation])
    end
    # 6
    it "重複したemailは登録できないこと" do
      user = create(:user)

      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email])
    end
    # 7
    it " passwordが6文字以上であれば登録できること " do
      user = build(:user, password: "000000", password_confirmation: "000000")
      expect(user).to be_valid
    end
    # 8
    it " passwordが5文字以下であれば登録できないこと " do
      user = build(:user, password: "00000", password_confirmation: "00000")
      user.valid?
      expect(user.errors[:password])
    end

  end
end