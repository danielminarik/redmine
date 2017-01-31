json.extract! issue, :id, :name, :description, :tracker_id, :status_id, :priority_id, :assignee_id, :created_by, :created_at, :updated_at
json.url issue_url(issue, format: :json)