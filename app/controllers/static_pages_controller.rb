class StaticPagesController < ApplicationController
  def home
    if logged_in?
      @micropost  = current_user.microposts.build
      @feed_items = current_user.feed.paginate(page: params[:page])
      if params[:search]
        @search = @feed_items.where("content LIKE ?", 
                      "%#{params[:search][:content]}%").paginate(page: params[:page])
      end
    end
  end

  def help
  end

  def about
  end

  def contact
  end
  
end
