class UsersController < ApplicationController
  before_action :load_user, except: [:index, :create, :new]
  before_action :authorize_user, except: [:index, :new, :create, :show]

  def index
    @users = User.all
    @hashtags = Hashtag.order(:text)
  end

  def new
    redirect_to root_path, alert: 'Вы уже залогинены!' if current_user.present?

    @user = User.new
  end

  def create
    redirect_to root_path, alert: 'Вы уже залогинены!' if current_user.present?
    @user = User.new(user_params)

    if @user.save
      session[:user_id] = @user.id
      redirect_to root_path, notice: 'Пользователь успешно зарегистрирован!'
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'Данные обновлены!'
    else
      render 'edit'
    end
  end

  def show
    # берём вопросы у найденного юзера
    @questions = @user.questions.order(created_at: :desc)

    # Для формы нового вопроса создаём заготовку, вызывая build у результата вызова метода @user.questions.
    @new_question = @user.questions.build

    @questions_count = @questions.count
    @answers_count = @questions.where.not(answer: nil).count
    @unanswered_count = @questions_count - @answers_count
  end

  def destroy
    @user.destroy
    redirect_to root_path, notice: 'Пользователь удален :('
  end

  private

  def authorize_user
    reject_user unless @user == current_user
  end

  def load_user
    begin
      @user ||= User.find params[:id]
    rescue ActiveRecord::RecordNotFound => e
      redirect_to root_url, alert: 'Пользователь не найден'
    end
  end

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation,
                                 :name, :username, :avatar_url, :background_color)
  end
end
