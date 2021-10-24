class MessagesController < ApplicationController
    def new
        @message = current_user.messages.build
        @user = User.find(params[:id])
        debugger
        current_user.talks.each do |talk|
            if talk.members.select(@user)
                redirect_to talk_path(talk)
            end
        end
            
    end
end
