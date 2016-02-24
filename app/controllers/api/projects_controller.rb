module Api
  class ProjectsController < Api::BaseController
    # This filter call before each action
    # Reference http://guides.rubyonrails.org/action_controller_overview.html#filters
    before_action {
      action = action_name == 'index' ? 'Get' : action_name.capitalize
      DEFAULT_SUCCESS_RESPONSE.merge!({ message: '%{action} project success' % { action: action } })
      DEFAULT_FAILURE_RESPONSE.merge!({ message: '%{action} project failure' % { action: action } })
    }

    def index
      projects = Project.all
      response = projects.present? ? DEFAULT_SUCCESS_RESPONSE.merge({ data: projects }) : DEFAULT_FAILURE_RESPONSE

      render json: response
    end

    def show
      project  = Project.find(params[:id])
      response = project.present? ? DEFAULT_SUCCESS_RESPONSE.merge({ data: project }) : DEFAULT_FAILURE_RESPONSE

      render json: response
    end

    def create
      project  = Project.create!(project_params)
      response = project.present? ? DEFAULT_SUCCESS_RESPONSE : DEFAULT_FAILURE_RESPONSE

      render json: response
    end

    def update
      project         = Project.find(params[:id])
      updated_project = project.present? ? project.update_attributes!(project_params) : false
      response        = updated_project ? DEFAULT_SUCCESS_RESPONSE : DEFAULT_FAILURE_RESPONSE

      render json: response
    end

    def destroy
      project = Project.find(params[:id])
      project.destroy if project.present?

      response = project.destroyed? ? DEFAULT_SUCCESS_RESPONSE : DEFAULT_FAILURE_RESPONSE
      render json: response
    end

    private
    # Reference more about strong parameters http://guides.rubyonrails.org/action_controller_overview.html#strong-parameters
    def project_params
      params.permit(:id, :name, :description, :active)
    end
  end
end
