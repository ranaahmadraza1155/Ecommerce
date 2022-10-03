class Product < ApplicationRecord
  belongs_to :Catageroy
  has_one_attached :f_image
  has_many :carts,  foreign_key: "pid", dependent: :destroy
  validates :title, presence: true
  validates :qty, presence: true
  validates :des, presence: true

    



end
