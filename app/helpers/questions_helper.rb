module QuestionsHelper
  def author_id(id)
    User.find_by(id: id)
  end
end
