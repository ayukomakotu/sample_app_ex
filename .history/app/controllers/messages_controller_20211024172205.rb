class MessagesController < ApplicationController
    def new
        @message = current_user.messages.build
        @user = User.find(params[:id])
        room = []
        current_user.talks.each do |talk|
            talk.members.each do |member|
                if member == @user
                    redirect_to talk_path(talk)
                end
            end
        end
        debugger
    end
end
