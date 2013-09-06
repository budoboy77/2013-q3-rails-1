class MainController < ApplicationController
  before_filter do
    if session[:author_id] != nil
      @author = Author.find(session[:author_id])
    end
  end

  before_filter except: ["index", "login", "login_post", "logout"] do
    if @author == nil
      flash[:error] = "You must be logged in to view that page"
      session[:original_route] = request.path_info
      redirect_to "/login" and return
    end
  end

  def index
    @blog_posts = BlogPost.order("post_date DESC").all
    render :index and return
  end

  def login
    render :login and return
  end

  def login_post
    username = params["username"]
    password = params["password"]

    author = Author.where(username: username).first
    if author == nil
      flash[:error] = "Incorrect username"
      redirect_to "/login" and return
    elsif author.authenticate(password) == false
      flash[:error] = "Incorrect password"
      redirect_to "/login" and return
    else
      session[:author_id] = author.id

      original_route = session[:original_route]
      if original_route != nil
        session[:original_route] = nil
        redirect_to original_route and return
      else
        redirect_to "/" and return
      end
    end
  end

  def logout
    session.clear
    redirect_to "/" and return
  end

  def edit_get
    @edit_blog_post = BlogPost.find(params[:id])
    @edit_blog_post_post_date = @edit_blog_post.post_date
    @edit_blog_post_body = @edit_blog_post.body
    render :edit and return
  end

  def edit_post
    edit_blog_post = BlogPost.find(params[:id])
    edit_blog_post.post_date = params[:post_date]
    edit_blog_post.body = params[:body]
    edit_blog_post.save!
    redirect_to "/edit/#{edit_blog_post.id}" and return
  end

  def new_get
    render :new and return
  end

  def new_post
    new_blog_post = BlogPost.new
    new_blog_post.author_id = session[:author_id]
    new_blog_post.post_date = params[:post_date]
    new_blog_post.body = params[:body]
    new_blog_post.save!
    redirect_to "/" and return
  end
end
