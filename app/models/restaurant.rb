class Restaurant < ApplicationRecord
  belongs_to :operator
  # has_many :seats
end
