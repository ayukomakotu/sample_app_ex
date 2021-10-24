class MessagesController < ApplicationController
    def new
        @message = current_user.messages.build
        @user = User.find(params[:id])
        room = []
        current_user.talks.each do |talk|
            if talk.members.select(@user)
                room.push(talk)
            end
        end
        debugger
    end
end
