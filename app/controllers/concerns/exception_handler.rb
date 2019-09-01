module ExceptionHandler
  # provides the more graceful `included` method
  extend ActiveSupport::Concern

  included do
    ActionController::Parameters.action_on_unpermitted_parameters = :raise

    rescue_from ActionController::UnpermittedParameters do |e|
      json_response({}, :unprocessable_entity, 422, "Unpermitted parameters received" )
    end

    rescue_from ActionController::ParameterMissing do |e|
      json_response({} , :unprocessable_entity, 422, "Required parameter missing")
    end

    rescue_from ArgumentError do |e|
      json_response({} , :unprocessable_entity, 422, "Invalid parameters")
    end

    rescue_from ActiveRecord::RecordNotFound do |e|
      json_response({} , :not_found, 404, 'Record Not Found')
    end

    rescue_from ActiveRecord::RecordInvalid do |e|
      json_response({} , :unprocessable_entity, 422, e.message)
    end
  end
end
