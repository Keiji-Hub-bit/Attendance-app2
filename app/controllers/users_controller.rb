class UsersController < ApplicationController
  before_action :set_user,only: [:show, :edit, :update, :destroy, :edit_basic_info, :update_basic_info]
  before_action :logged_in_user, only: [:index, :show, :edit, :update, :destroy, :edit_basic_info, :update_basic_info]
  before_action :correct_user,only: [:edit, :update]
  before_action :admin_or_correct_user, only: [:show, :edit_basic_info]
  before_action :admin_user,only: [:destroy, :edit_basic_info, :update_basic_info]
  before_action :set_one_month, only: :show


  def index
    method = params[:search_method]
    word = params[:search_word]
    @users = User.paginate(page: params[:page]).search(method,word)
    
    if word == ""
      flash.now[:info] = "検索ワードを入力してください。"
    elsif word != params[:search]
      flash.now[:info] = "検索ワード#{word}に一致するユーザーはいません。"
    end
      
    # @users = User.search(method,word)
    # @users = User.where(activated: true).paginate(page: params[:page]).search(params[:search])
    # @users = User.paginate(page: params[:page])
  end
  
  def show
    @workded_sum = @attendances.where.not(started_at: nil).count
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user #保存成功後ログインする
      flash[:success] = '新規作成に成功しました。'
      redirect_to @user
    else
      render :new
    end
  end
  
  def edit
  end
  
  def update
    if @user.update_attributes(user_params)
      flash[:success] = "ユーザー情報を更新しました。"
      redirect_to @user
    else
      render :edit
    end
  end
  
  def destroy
    @user.destroy
    flash[:success] = "#{@user.name}のデータを削除しました。"
    redirect_to users_url
  end
  
  def edit_basic_info
  end

  def update_basic_info
    if  @user.update_attributes(basic_info_params)
        @user.save
        flash[:success] = "#{@user.name}の更新に成功しました。"
    else
        flash[:danger] = "#{@user.name}の更新は失敗しました。<br>" + @user.errors.full_messages.join("<br>")
    end
        redirect_to users_url
  end
  
  private
  
    def user_params
      params.require(:user).permit(:name, :email, :department, :password, :password_confirmation)
    end
   
    def basic_info_params
      params.require(:user).permit(:department, :basic_time, :work_time)
    end
end
    # def logged_in
    #   if !current_user.nil? after logged_in
    #     flash.now[:info] = "すでにログインしています。"
    #   end
    # end
    
   

