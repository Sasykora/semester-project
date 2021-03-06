class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  require 'csv'
  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
  end

  def csv_upload

  end

  def post_csv
    uploaded_io = params[:csv]
    @group = Group.find(params[:group])
    data = uploaded_io.read
    csv = CSV.parse(data, headers: true)
    csv.each do |row|
      logger.warn(row.to_hash)
      @user = User.new(row.to_hash)
      @user.group = @group
      @user.save

    end
  end

  # GET /users/new
  def new
    @user = User.new
  end

  # GET /users/1/edit
  def edit
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
        format.html { redirect_to @user, notice: 'User was successfully created.' }
        format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def company_manager_data

  end

  def company_manager_by_channel
    @channels = Channel.all
    @channel_id = params[:channel_id]
    @topic_ids = Topic.where(:channel_id => @channel_id).pluck(:id).uniq
  end

  def company_manager_by_user
    @user_id = params[:user_id]
    @users = User.where(:group_id => 1)
  end

  def company_manager_show_table
    @sort = params[:sort]
    @posts = Post.get_posts_for_show_table(@sort)
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name)
    end

    def csv_params
      params.permit(:csv, :group)
    end
end
