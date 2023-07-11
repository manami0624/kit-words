class Dictionary < ApplicationRecord
  belongs_to :user

  validates :vocabulary, presence: true, length: { maximum: 10 }, uniqueness: { scope: :user_id, message: "既に登録されている単語です" }
  validates :meaning, presence: true, length: { maximum: 120, message: "意味は120文字以内で入力してください" }


  def self.search(search)
    if search != ""
      Dictionary.where(['vocabulary LIKE ? OR meaning LIKE ?', "%#{search}%", "%#{search}%"])
    else
      Dictionary.all
    end
  end
end
