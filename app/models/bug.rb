class Bug < ApplicationRecord
  belongs_to :project
  has_many :users
  validates :title, uniqueness: true
  validates :title, :status_is, :typeOf, presence: true
  mount_uploaders :screen_shot, ScreenShotUploader
  enum typeOf: %i[feature bug]
  enum status_is: %i[New started completed resolved]


end
