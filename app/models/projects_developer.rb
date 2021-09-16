class ProjectsDeveloper < ApplicationRecord
  has_many :projects, through: :users
  has_many :users, through: :projects
end
