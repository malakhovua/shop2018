class CommentObserver < ActiveRecord::Observer
  def after_commit(comment)
    action = if comment.persisted?
               'comments.new'
             else
               'comments.destroy'
             end
    # binding.pry
    CommentJob.perform_later(action, comment.as_json)
  end
end
