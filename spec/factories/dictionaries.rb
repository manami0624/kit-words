FactoryBot.define do
  factory :dictionary do
    vocabulary{'모델 단위 테스트'}
    japanese {'モデル単体テスト'}
    meaning {'소프트웨어 개발에서 데이터 모델(모델)의 동작이나 기능을 테스트하기 위해 테스트 케이스를 만드는 것.'}
    association :user 
  end
end
