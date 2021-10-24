class MessagesController < ApplicationController
    def new
        @message = current_user.messages.build
    end
end
