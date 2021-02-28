class HashtagsController < ApplicationController
  before_action :set_hashtag, only: [:show]

  def show
    @questions = @hashtag.questions
  end

  def set_hashtag
    @hashtag = Hashtag.find_by!(text: params[:text])
  end
end
