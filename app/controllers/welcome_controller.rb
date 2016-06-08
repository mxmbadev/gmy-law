class WelcomeController < ApplicationController

  def index
    @posts = Post.all.limit(6).order("created_at desc")
  end

  def about

  end

  def work
    
  end

end
