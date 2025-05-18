class ProductionUsersController < ApplicationController
  before_action :set_production_user, only: [:show, :edit, :update, :destroy]

  # GET /production_users
  # GET /production_users.json
  def index
    @production_users = ProductionUser.all
  end

  # GET /production_users/1
  # GET /production_users/1.json
  def show
  end

  # GET /production_users/new
  def new
    @production_user = ProductionUser.new
  end

  # GET /production_users/1/edit
  def edit
  end

  # POST /production_users
  # POST /production_users.json
  def create
    @production_user = ProductionUser.new(production_user_params)

    respond_to do |format|
      if @production_user.save
        format.html { redirect_to @production_user, notice: 'Production user was successfully created.' }
        format.json { render :show, status: :created, location: @production_user }
      else
        format.html { render :new }
        format.json { render json: @production_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /production_users/1
  # PATCH/PUT /production_users/1.json
  def update
    respond_to do |format|
      if @production_user.update(production_user_params)
        format.html { redirect_to @production_user, notice: 'Production user was successfully updated.' }
        format.json { render :show, status: :ok, location: @production_user }
      else
        format.html { render :edit }
        format.json { render json: @production_user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /production_users/1
  # DELETE /production_users/1.json
  def destroy
    @production_user.destroy
    respond_to do |format|
      format.html { redirect_to production_users_url, notice: 'Production user was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def user_config

    case params[:verb]
    when "add"
      if !User.find_by_email(params[:email]).present?
      else
        @user = User.find_by_email(params[:email])
        @production_user = ProductionUser.find_or_create_by(production_id: params[:production_id], user_id: @user.id)
        render json: @production_user.user
      end

    when "remove"
        ProductionUser.find_by(production_id: params[:production_id], user_id: params[:user_id]).destroy
        render status: 200, json: {
          message: "Successful!",
        }.to_json
    else
    end

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_production_user
      @production_user = ProductionUser.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def production_user_params
      params.require(:production_user).permit(:production_id, :user_id, :role)
    end
end
