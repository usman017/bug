class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  enum user_type: %i[Manager Developer QA]
  has_many :projects
  has_many :bugs
  has_many :project_accesses
  has_many :project, through: :project_accesses

end
