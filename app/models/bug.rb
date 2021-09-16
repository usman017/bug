class Bug < ApplicationRecord
  belongs_to :project
  has_many :developers_bugs
  has_many :users
  has_many :developers, class_name: 'User', through: :developers_bugs
  validates :title, :uniqueness => {:scope => :project_id }
  validates :title, :status_is, :typeOf, presence: true
  mount_uploaders :screen_shot, ScreenShotUploader
  enum typeOf: %i[feature bug]
  enum status_is: %i[New started completed resolved]
end
