class Article < ApplicationRecord
  belongs_to :editor

  def self.search(search)
    if search
      where(["headline LIKE ?", "%#{search}%"])
      where(["body LIKE ?", "%#{search}%"])
    else
      all
    end
  end
end
