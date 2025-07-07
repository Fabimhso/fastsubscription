class ProjectsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  def new
    @project = Project.new
  end

  def create
    @project = current_user.projects.build(project_params)
    if @project.save
      @project.project_histories.create!(
        user: current_user,
        action: :created,
        description: "Project '#{@project.name}' was created"
      )
      redirect_to projects_path, notice: 'Project created successfully!'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def index
    @projects = current_user.projects.order(created_at: :desc)
  end

  def show
    @histories = @project.project_histories.includes(:user).order(created_at: :desc)
  end

  def edit
  end

  def update
    if @project.update(project_params)
      @project.project_histories.create!(
        user: current_user,
        action: :updated,
        description: "Project '#{@project.name}' was updated"
      )
      redirect_to @project, notice: 'Project updated successfully!'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    project_name = @project.name
    @project.project_histories.create!(
      user: current_user,
      action: :deleted,
      description: "Project '#{project_name}' was deleted"
    )
    @project.destroy
    redirect_to projects_path, notice: 'Project deleted successfully!'
  end

  private

  def set_project
    @project = current_user.projects.find(params[:id])
  end

  def project_params
    params.require(:project).permit(:name, :description)
  end
end
