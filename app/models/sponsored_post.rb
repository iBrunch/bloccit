class SponsoredPost < ActiveRecord::Base
  belongs_to :topic
  belongs_to :user
  validates :title, length: { minimum: 5 }, presence: true
  validates :body, length: { minimum: 20 }, presence: true
  validates :price, length: { minimum: 1 }, presence: true
  validates :price, numericality: { greater_than: 0 }, presence: true
  validates :topic, presence: true
  
end
