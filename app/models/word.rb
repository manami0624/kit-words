class Word < ApplicationRecord
  validates :korean, :japanese, presence: true
  belongs_to :user

  validates :korean, :japanese, presence: true, length: { maximum: 10 }
  validates :korean, uniqueness: { scope: :user_id, message: "既に登録されている単語です" }

  def self.search(search)
    if search != ""
      Word.where(['korean LIKE ? OR japanese LIKE ?', "%#{search}%", "%#{search}%"])
    else
      Word.all
    end
  end
end
