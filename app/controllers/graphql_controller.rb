class GraphqlController < ApplicationController
  skip_before_action :verify_authenticity_token
  before_action :set_current_user

  def execute
    variables = ensure_hash(params[:variables])
    query = params[:query]
    operation_name = params[:operationName]
    context = {
      warden: warden
    }
    result = WFPlatformSchema.execute(query, variables: variables, context: context, operation_name: operation_name)
    render json: result
  end

  private

  # Handle form data, JSON body, or a blank value
  def ensure_hash(ambiguous_param)
    case ambiguous_param
    when String
      if ambiguous_param.present?
        ensure_hash(JSON.parse(ambiguous_param))
      else
        {}
      end
    when Hash, ActionController::Parameters
      ambiguous_param
    when nil
      {}
    else
      raise ArgumentError, "Unexpected parameter: #{ambiguous_param}"
    end
  end

  private

  def set_current_user
    verified_user = User.find_by(id: cookies.signed['user.id'])

    if verified_user
      verified_user
    else
      Rails.logger.info("No verified user")
      nil
    end
  end

  def warden
    request.env['warden']
  end
end
