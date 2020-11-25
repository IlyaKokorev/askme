class UsersController < ApplicationController
  def index
  end

  def new
  end

  def edit
  end

  def show
    @user = User.new(
        name: 'Ilya',
        username: 'IlyaCatran',
        avatar_url: 'https://i.kym-cdn.com/entries/icons/facebook/000/001/828/tumblr_kwq40tsEWG1qzznvj.jpg'
    )
  end
end
