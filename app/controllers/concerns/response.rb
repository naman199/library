module Response
  def json_response(object, status = :success, status_code = 200, message = "")
    render json: {status: status, status_code: status_code, message: message, data: object}
  end
end
