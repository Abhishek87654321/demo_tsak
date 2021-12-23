class BlogsController < ApplicationController
  before_action :set_blog , only: %i[edit update destroy show]

  def index
    @blogs = Blog.all
  end

  def destroy
    @blog.destroy
    respond_to do |format|
    format.html { redirect_to action: "index", notice: "post was successfully destroyed." }
    format.js {render :layout=> false}
    end
  end
  
  def edit
  end

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    if @blog.save
      redirect_to action: "index"
    else
      # flash [:notice] : 'something went wrong , please retry.'
      render "new"
    end
  end
     
  def update
    if @blog.update(blog_params)
       redirect_to action: "index", notice: "post was successfully updated." 
     else
      #  flash[:notice] : 'something went wrong , please retry.'
       render "edit"
     end
  end

  def show
    @blog_comments = @blog.comments
  end

  private

   def set_blog
    @blog = Blog.find_by_id(params[:id])
   end

   def blog_params
    params.require(:blog).permit(:title , :description)
   end
end

