class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum user_type: %i[Manager Developer QA]
  has_many :projects
  has_many :developers, class_name: 'User', through: :developers_bugs
  has_many :developers, class_name: 'User', through: :projects_developers

  has_many :developers_bugs
  has_many :projects_developers

  has_many :bugs
  # has_many :project_accesses
  # has_many :project, through: :project_accesses

end
