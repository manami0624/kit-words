require 'rails_helper'

RSpec.describe Word, type: :model do
  before do
    @word = FactoryBot.build(:word)
  end

  describe '単語帳の保存' do
    context '単語帳が投稿できる場合' do
      it '韓国語と日本語を投稿できる' do
        expect(@word).to be_valid
      end
      it '同じ韓国語でも他のユーザーであれば投稿できる' do
        @word.save
        another_user = FactoryBot.create(:user)
        another_word = FactoryBot.build(:word, user_id: another_user.id, korean: @word.korean)
        another_word.valid?
        expect(another_word).to be_valid
      end
    end

    context '単語帳が投稿できない場合' do
      it '韓国語が空では投稿できない' do
        @word.korean = ''
        @word.valid?
        expect(@word.errors.full_messages).to include("韓国語を入力してください")
      end 
      it '日本語が空では投稿できない' do
        @word.japanese = ''
        @word.valid?
        expect(@word.errors.full_messages).to include("日本語を入力してください")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @word.user = nil
        @word.valid?
        expect(@word.errors.full_messages).to include('Userを入力してください')
      end
      it '韓国語が11文字以上だと投稿できない' do
        @word.korean = '테스트테스트테스트테스트'
        @word.valid?
        expect(@word.errors.full_messages).to include("韓国語は10文字以内で入力してください")
      end
      it '日本語が11文字以上だと投稿できない' do
        @word.japanese = 'テストテストテストテスト'
        @word.valid?
        expect(@word.errors.full_messages).to include("日本語は10文字以内で入力してください")
      end
      it '同じユーザーが前に登録された韓国語は投稿できない' do
        @word.save
        another_word = FactoryBot.build(:word, user_id: @word.user_id, korean: @word.korean)
        another_word.valid?
        expect(another_word.errors.full_messages).to include("韓国語: 既に登録されている単語です")
      end
    end
  end
end
