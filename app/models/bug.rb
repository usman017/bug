class Bug < ApplicationRecord
  belongs_to :project
  validates :title, uniqueness: true
  validates :title, :status, :type, presence: true

  enum type: [:feature, :bug]
  enum status: [:new, :started, :completed, :resolved]
end
