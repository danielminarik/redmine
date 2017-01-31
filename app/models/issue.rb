class Issue < ApplicationRecord
  has_one :priority
  has_one :status
  has_one :tracker
end
