class ApplicationController < ActionController::API

  protected

  def req_headers
    request.headers.env.select{|k, _| k.in?(ActionDispatch::Http::Headers::CGI_VARIABLES) || k =~ /^HTTP_/}
  end
end
