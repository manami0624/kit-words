class Word < ApplicationRecord
  belongs_to :user

  validates :korean, presence: true, length: { maximum: 10 }, uniqueness: { scope: :user_id, message: ": 既に登録されている単語です" }
  validates :japanese, presence: true, length: { maximum: 10 }
  
  scope :latest, -> {order(created_at: :desc)}
  scope :old, -> {order(created_at: :asc)}
  # scope :random, -> { order('RAND()') }
  scope :random, -> { order('RANDOM()') }

  def self.search(search)
    if search != ""
      Word.where(['korean LIKE ? OR japanese LIKE ?', "%#{search}%", "%#{search}%"])
    else
      Word.all
    end
  end
end
