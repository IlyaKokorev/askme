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
        avatar_url: 'https://linlt.com/upload/photos/2019/01/udthvlXOe2d3xWv8vLk4_22_f268a0a090e3cefcb0564430f6bd3ca8_avatar.jpg?cache=0'
    )

    @questions = [
        Question.new(text: 'Как дела?', created_at: Date.parse('25.11.2020')),
        Question.new(text: 'Как сам?', created_at: Date.parse('25.11.2020'))
    ]

    @new_question = Question.new
  end
end
