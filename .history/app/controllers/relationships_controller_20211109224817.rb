class RelationshipsController < ApplicationController
    before_action :logged_in_user
    #POST /Relationships
    def create
        @user = User.find(params[:followed_id])
        current_user.follow(@user)
        respond_to do |format|
            format.html { redirect_to @user }
            format.js
        end
        if @user.follow_notify == true
        @user.send_more_followers_email(current_user)
    end
  
    #DELETE /Relationships/ :id
    def destroy
        @user = Relationship.find(params[:id]).followed
        current_user.unfollow(@user)
        respond_to do |format|
            format.html { redirect_to @user }
            format.js
        end
    end
end
