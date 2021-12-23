class CommentsController < ApplicationController
  before_action :find_comment , only: %i[edit update destroy show create]
  def new
    @comment = Comment.new
  end

  def create
    @comment = @post.comments.build(comment_params)
    respond_to do |format|
    if @comment.save
      format.html {redirect_to action: "index"}
      format.js
    else
      format.html{redirect_to action: "new"}
      format.js
    end
  end
  end

  def edit
  end

  def update
      if @comment.update(comment_params)
        redirect_to posts_url
      else
        redirect_to action: 'edit'
      end
  end

  def show
  end
  
  def comment_new
    response = {}
    @comments = Comment.new
    @post = Post.find_by_id(params[:id])
    response[:comment] = @post.comments.create(title: params[:title])
    render json: response
    
  end

  def destroy
    @comment.destroy
    # redirect_to action: "index"
  end

  def index
    @comments = Comment.all
  end
  private
  def find_comment
    @comment = Comment.find_by_id(params[:id])
  end

  def comment_params
    params.require(:comment).permit(:title, :commentable_id , :commentable_type)
  end
end
