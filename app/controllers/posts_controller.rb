class PostsController < ApplicationController
  before_action :set_post , only: %i[edit update destroy show]

  def index
    @post = Post.all
    
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to action: "index", notice: "post was successfully destroyed." }
      format.js {render :layout=> false}
    end
  end

  def edit
  end

  def new
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      # flash[:notice] = 'post was successfully created.'
      redirect_to action: "index"
    else
      redirect_to action: "new", notice: 'something went wrong , please retry.'
    end
  end

  def update
    if @post.update(post_params)
      redirect_to action: "index", notice: "post was successfully updated." 
    else
      redirect_to action: "edit", notice: 'something went wrong , please retry.'
    end
  end

  def show
    @post_comments = @post.comments
  end
  private
  def set_post
    @post = Post.find_by_id(params[:id])
  end
  def post_params
    params.require(:post).permit(:title , :description)
  end
end
