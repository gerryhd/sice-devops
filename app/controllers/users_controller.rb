class UsersController < ApplicationController
  before_action :set_user, only: [:show, :update, :destroy]
  before_action :log_headers
  before_action :log_body

  # GET /users
  def index
    @users = User.all

    render json: @users
  end

  # GET /users/1
  def show
    render json: @user
  end

  # POST /users
  def create
    @user = User.new(user_params)

    if @user.save
      render json: @user, status: :created, location: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /users/1
  def update
    if @user.update(user_params)
      render json: @user
    else
      render json: @user.errors, status: :unprocessable_entity
    end
  end

  # DELETE /users/1
  def destroy
    @user.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      logger.debug("Method called: #{__method__}, parameters: none")
      @user = User.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def user_params
      logger.debug("Method called: #{__method__}, parameters: none")
      params.require(:user).permit(:name, :folio, :phone)
    end

    def log_headers
      logger.info("Headers: #{req_headers}")
    end

    def req_headers
      request.headers.env.select{|k, _| k.in?(ActionDispatch::Http::Headers::CGI_VARIABLES) || k =~ /^HTTP_/}
    end

    def log_body
      body_params = replace_nested_hash_value(params, ["password"], "********")
      logger.info("Body: #{body_params.to_s}")
    end

    def replace_nested_hash_value(obj,keys, value)
      if obj.respond_to?(:key?) && keys.select { |key| obj.key?(key) }.any?
        keys.select { |key| obj.key?(key) }.each do |key|
          obj[key] = value
        end
      elsif obj.respond_to?(:each)
        r = nil
        obj.to_h.find{ |*a| r=nested_hash_value(a.last,keys, value) }
        r
      end
      
      obj
    end
end
