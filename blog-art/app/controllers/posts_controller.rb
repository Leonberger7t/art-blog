class PostsController < ApplicationController
  def index
    @posts = Post.all
  end

  def new
      @posts = Post.all
      @post = Post.new
  end

  def create
    @new_post = Post.create(
      title: params[:post][:title],
      content: params[:post][:content],
      user_id: params[:post][:user_id],
      location: params[:post][:location],
      exhibition: params[:post][:exhibition],
      image: params[:post][:image]
    )



    if @new_post
      redirect_to url_for(:controller => :posts, :action => :index)
    else
      redirect_to url_for(:controller => :posts, :action => :new)
    end
  end

  def show
    @post = Post.find(params[:id])
    @user_posts = @post.user.email


  end

  def edit
    @post = Post.find(params[:id])
  end

  def update
    @post = Post.find(params[:id])
    @post.update({
      title: params[:post][:title],
      content: params[:post][:content],
      user_id: params[:post][:user_id],
      location: params[:post][:location],
      exhibition: params[:post][:exhibition],
      image: params[:post][:image]
    })

    if (@post)
      redirect_to url_for(:controller => :posts, :action => :index)
    else
      redirect_to url_for(:controller => :posts, :action => :edit)
    end
  end

  def destroy
    Post.delete(params[:id])
    redirect_to url_for(:controller => :posts, :action => :index)
  end

end
