# frozen_string_literal: true
class Project < ApplicationRecord
  has_many :bugs, dependent: :delete_all
  belongs_to :user
  has_many :developers, class_name: 'User', through: :projects_developersuser
  has_many :projects_developers
end