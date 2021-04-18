require 'rails_helper'

RSpec.describe Card, type: :model do
  before do
    @card = FactoryBot.build(:card)
  end

  describe "クレジットカードの保存" do
    context "クレジットカードが保存できる場合" do
      it "全てのフォームが正しく入力できていれば登録できる" do
        expect(@card).to be_valid
      end
    end
    context "クレジットカードが保存できない場合" do
      it "userが紐付いていないと保存できない" do
        @card.user = nil
        @card.valid?
        expect(@card.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end
