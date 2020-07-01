class Song < ApplicationRecord
  validates_presence_of :title
  belongs_to :artist

  def self.average_length
    average(:length)
  end
end
