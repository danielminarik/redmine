class Issue < ApplicationRecord
  has_one :priority
  has_one :status
  has_one :tracker
  include PublicActivity::Model
  belongs_to :user
end
