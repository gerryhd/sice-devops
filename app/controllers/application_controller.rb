class ApplicationController < ActionController::API
  before_action :authenticate_request
  skip_before_action :authenticate_request, only: :health

  attr_reader :current_user

  def health
    head :ok
  end

  protected

  def req_headers
    request.headers.env.select{|k, _| k.in?(ActionDispatch::Http::Headers::CGI_VARIABLES) || k =~ /^HTTP_/}
  end

  private

  def authenticate_request
    @current_user = AuthorizeApiRequest.call(request.headers).result
    render json: { error: 'Not Authorized' }, status: 401 unless @current_user
  end
end
