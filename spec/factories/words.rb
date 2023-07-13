FactoryBot.define do
  factory :word do
    korean {'모델 단위 테스트'}
    japanese {'モデル単体テスト'}
    association :user 
  end
end