class Bug < ApplicationRecord
  belongs_to :project
  validates :title, uniqueness: true
  validates :title, :status_is, :typeOf, :screen_shot, presence: true
  mount_uploaders :screen_shot, ScreenShotUploader
  enum typeOf: %i[feature bug]
  enum status_is: %i[New started completed resolved]


end
