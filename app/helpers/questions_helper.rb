module QuestionsHelper
  def author_username(id)
    User.find_by(id: id)&.username
  end
end
