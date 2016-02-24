module Api
  class TasksController < BaseController
    # This filter call before each action
    # Reference http://guides.rubyonrails.org/action_controller_overview.html#filters
    before_action {
      action = action_name == 'index' ? 'Get' : action_name.capitalize
      DEFAULT_SUCCESS_RESPONSE.merge!({ message: '%{action} task success' % { action: action } })
      DEFAULT_FAILURE_RESPONSE.merge!({ message: '%{action} task failure' % { action: action } })
    }

    def index
      project  = Project.find(params[:project_id])
      tasks    = project.present? ? project.tasks : nil
      response = tasks.present? ? DEFAULT_SUCCESS_RESPONSE.merge({ data: tasks }) : DEFAULT_FAILURE_RESPONSE

      render json: response
    end

    def show
      project  = Project.find(params[:project_id])
      task     = project.present? ? project.tasks.find(params[:id]) : nil
      response = task.present? ? DEFAULT_SUCCESS_RESPONSE.merge({ data: task }) : DEFAULT_FAILURE_RESPONSE

      render json: response
    end

    def create
      project  = Project.find(params[:project_id])
      new_task = project.present? ? project.tasks.create!(task_params) : nil
      response = new_task.present? ? DEFAULT_SUCCESS_RESPONSE : DEFAULT_FAILURE_RESPONSE

      render json: response
    end

    def update
      project      = Project.find(params[:project_id])
      task         = project.present? ? project.tasks.find(params[:id]) : nil
      updated_task = task.present? ? task.update_attributes!(task_params) : false
      response     = updated_task ? DEFAULT_SUCCESS_RESPONSE : DEFAULT_FAILURE_RESPONSE

      render json: response
    end

    def destroy
      project = Project.find(params[:project_id])
      task    = project.present? ? project.tasks.find(params[:id]) : nil
      task.destroy if task.present?

      response = task.destroyed? ? DEFAULT_SUCCESS_RESPONSE : DEFAULT_FAILURE_RESPONSE
      render json: response
    end

    private
    def task_params
      params.permit(:id, :project_id, :name, :description, :active)
    end
  end
end
