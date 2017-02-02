class Issue < ApplicationRecord
  has_one :priority
  has_one :status
  has_one :tracker
  has_many :comment
  include PublicActivity::Model
  belongs_to :user
  validates :name, :tracker_id, :status_id, :priority_id, :assignee_id, presence: true

  def last_updated
    a = PublicActivity::Activity.where(issue_id: id).order("created_at").last
    unless a.nil?
      a.created_at.strftime('%d %B %Y %H:%M')
    end
  end

end
