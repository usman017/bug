# frozen_string_literal: true
class ProjectsDeveloper < ApplicationRecord
  belongs_to :project
  belongs_to :user, foreign_key: :developer_id
end
