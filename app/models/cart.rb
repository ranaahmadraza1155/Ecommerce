class Cart < ApplicationRecord
    validates :pid, presence: true, uniqueness: true
    validates :title, presence: true
    validates :title, presence: true

end
