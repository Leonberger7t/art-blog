class CommentsController < ApplicationController
  def index
    @comments = Comment.all
  end

  def new
      @comments = Comment.all
      @comment = Comment.new
  end

  def create
    @new_comment = Comment.create(
      content: params[:comment][:content],
      user_id: params[:comment][:user_id],
      post_id: params[:comment][:post_id]

    )



    if @new_comment
      redirect_to url_for(:controller => :comments, :action => :index)
    else
      redirect_to url_for(:controller => :comments, :action => :new)
    end
  end

  def show
    @comment = Comment.find(params[:id])


  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update
    @comment = Comment.find(params[:id])
    @comment.update({
      content: params[:comment][:content],
      user_id: params[:comment][:user_id],
      post_id: params[:comment][:post_id]
    })

    if (@comment)
      redirect_to url_for(:controller => :comments, :action => :index)
    else
      redirect_to url_for(:controller => :comments, :action => :edit)
    end
  end

  def destroy
    Comment.delete(params[:id])
    redirect_to url_for(:controller => :comments, :action => :index)
  end

end
