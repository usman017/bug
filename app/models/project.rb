class Project < ApplicationRecord
  has_many :bugs, dependent: :delete_all
  has_many :project_accesses
  has_many :user, through: :project_accesses
end