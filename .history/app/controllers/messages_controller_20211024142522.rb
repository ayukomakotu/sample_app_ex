class MessagesController < ApplicationController
    def new
        @message = current_user.messages.build
        @user = User.find(params[:id])
    end
end
