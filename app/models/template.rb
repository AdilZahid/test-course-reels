class Template < ApplicationRecord
  has_one_attached :file
  belongs_to :course
end
