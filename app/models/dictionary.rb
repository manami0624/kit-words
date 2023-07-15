class Dictionary < ApplicationRecord
  belongs_to :user

  validates :vocabulary, presence: true, length: { maximum: 10 }, uniqueness: { scope: :user_id, message: ": 既に登録されている単語です" }
  validates :meaning, presence: true, length: { maximum: 120 }

  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  scope :random, -> { order('RAND()') }

  def self.search(search)
    if search != ""
      Dictionary.where(['vocabulary LIKE ? OR meaning LIKE ?', "%#{search}%", "%#{search}%"])
    else
      Dictionary.all
    end
  end
end
