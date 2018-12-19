class CommentsController < ApplicationController
  skip_before_action :authorize

  include Productable


  def index
    # binding.pry
    @comments = @product.comments
    @comment = @product.comments.new
  end

  def destroy
    @comment = @product.comments.find_by(id: params[:id], user: current_user)
    @comment.destroy if @comment.present?
    head :no_content
  end

  def create
    # binding.pry
    @comment = @product.comments.build(comment_params)
    @comment.user = current_user
    if @comment.save
      if request.xhr?
        render json: @comment
      else
        redirect_to product_comments_path(@product)
      end

    else
      if request.xhr?
        render json: { errors: @comment.errors.messages }
      else
        @comments = @product.comments
        render :index
      end
    end

  end

  private

  def comment_params
    params.require(:comment).permit(:text)
  end
end
