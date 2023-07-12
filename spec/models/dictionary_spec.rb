require 'rails_helper'

RSpec.describe Dictionary, type: :model do
  before do
    @dictionary = FactoryBot.build(:dictionary)
  end

  describe '辞書の保存' do
    context '辞書が投稿できる場合' do
      it '単語と意味を投稿できる' do
        expect(@dictionary).to be_valid
      end
      it '同じ単語でも他のユーザーであれば投稿できる' do
        @dictionary.save
        another_user = FactoryBot.create(:user)
        another_dictionary = FactoryBot.build(:word, user_id: another_user.id, korean: @dictionary.vocabulary)
        another_dictionary.valid?
        expect(another_dictionary).to be_valid
      end
    end

    context '辞書が投稿できない場合' do
      it '単語が空では投稿できない' do
        @dictionary.vocabulary = ''
        @dictionary.valid?
        expect(@dictionary.errors.full_messages).to include("単語を入力してください")
      end 
      it '意味が空では投稿できない' do
        @dictionary.meaning = ''
        @dictionary.valid?
        expect(@dictionary.errors.full_messages).to include("意味を入力してください")
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @dictionary.user = nil
        @dictionary.valid?
        expect(@dictionary.errors.full_messages).to include('Userを入力してください')
      end
      it '辞書が11文字以上だと投稿できない' do
        @dictionary.vocabulary = '테스트테스트테스트테스트'
        @dictionary.valid?
        expect(@dictionary.errors.full_messages).to include("単語は10文字以内で入力してください")
      end
      it '意味が121文字以上だと投稿できない' do
        @dictionary.meaning = '한' * 121
        @dictionary.valid?
        expect(@dictionary.errors.full_messages).to include("意味は120文字以内で入力してください")
      end
      it '同じユーザーが前に登録された韓国語は投稿できない' do
        @dictionary.save
        another_dictionary = FactoryBot.build(:dictionary, user_id: @dictionary.user_id, vocabulary: @dictionary.vocabulary)
        another_dictionary.valid?
        expect(another_dictionary.errors.full_messages).to include("単語: 既に登録されている単語です")
      end
    end
  end
end
