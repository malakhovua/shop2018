class CommentsController < ApplicationController
  before_action :set_product

  def index
    # binding.pry
    @comments = @product.comments
    @comment = @product.comments.new
  end

  def create
    # binding.pry
    @comment = @product.comments.build(comment_params)
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

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy

    redirect_to product_comments_path
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def comment_params
    params.require(:comment).permit(:nick, :text)
  end
end
