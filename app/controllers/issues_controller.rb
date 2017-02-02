class IssuesController < ApplicationController
  load_and_authorize_resource
  before_action :set_issue, only: [:show, :edit, :update, :destroy]

  # GET /issues
  # GET /issues.json
  def index
    @issues = Issue.all.order("created_at DESC")
  end

  # GET /issues/1
  # GET /issues/1.json
  def show
    @comment = Comment.new
    @activities = PublicActivity::Activity.all.where(issue_id: params[:id])
  end

  # GET /issues/new
  def new
    @issue = Issue.new
  end

  # GET /issues/1/edit
  def edit
  end

  # POST /issues
  # POST /issues.json
  def create
    p = issue_params
    p[:created_by] = current_user.id
    @issue = Issue.new(p)

    respond_to do |format|
      if @issue.save
        format.html { redirect_to issues_path, notice: 'Issue was successfully created.' }
        format.json { render :show, status: :created, location: @issue }
        @issue.create_activity(:create, owner: current_user, issue_id: @issue.id)
      else
        format.html { render :new }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /issues/1
  # PATCH/PUT /issues/1.json
  def update
    p = {}
    if issue_params[:name] != @issue.name
      p[:name] = issue_params[:name]
    end
    if issue_params[:description] != @issue.description
      p[:description] = true
    end
    if issue_params[:tracker_id].to_i != @issue.tracker_id
      p[:tracker_id] = issue_params[:tracker_id]
    end
    if issue_params[:priority_id].to_i != @issue.priority_id
      p[:priority_id] = issue_params[:priority_id]
    end
    if issue_params[:status_id].to_i != @issue.status_id
      p[:status_id] = issue_params[:status_id]
    end
    if issue_params[:assignee_id].to_i != @issue.assignee_id
      p[:assignee_id] = issue_params[:assignee_id]
    end

    respond_to do |format|
      if @issue.update(issue_params)
        format.html { redirect_to @issue, notice: 'Issue was successfully updated.' }
        format.json { render :show, status: :ok, location: @issue }
        @issue.create_activity(:update, owner: current_user, issue_id: @issue.id, parameters: p)
      else
        format.html { render :edit }
        format.json { render json: @issue.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /issues/1
  # DELETE /issues/1.json
  def destroy

    Comment.where(issue_id: @issue.id).destroy_all
    PublicActivity::Activity.where(issue_id: @issue.id).destroy_all
    @issue.destroy
    respond_to do |format|
      format.html { redirect_to issues_url, notice: 'Issue was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_issue
      @issue = Issue.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def issue_params
      params.require(:issue).permit(:name, :description, :tracker_id, :status_id, :priority_id, :assignee_id, :created_by)
    end
end
