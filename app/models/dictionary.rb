class Dictionary < ApplicationRecord
  belongs_to :user

  validates :vocabulary, presence: true, length: { maximum: 10 }, uniqueness: { scope: :user_id, message: ": 既に登録されている単語です" }
  validates :meaning, length: { maximum: 120 }
  validates :japanese, presence: true, length: { maximum: 10 }

  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  # scope :random, -> { order('RAND()') }
  scope :random, -> { order('RANDOM()') }


  def self.search(search)
    if search != ""
      Dictionary.where(['vocabulary LIKE ? OR japanese LIKE ? OR meaning LIKE ?', "%#{search}%", "%#{search}%", "%#{search}%"])
    else
      Dictionary.all
    end
  end
end
