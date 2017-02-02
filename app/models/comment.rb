class Comment < ApplicationRecord
  has_one :issue
  has_one :user
  belongs_to :issue
  include PublicActivity::Model
end
