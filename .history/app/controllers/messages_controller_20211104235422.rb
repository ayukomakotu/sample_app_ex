class MessagesController < ApplicationController
    before_action :logged_in_user

    def create
        @talk = Talk.find(params[:message][:talk_id])
        @message = current_user.messages.build(message_params)
        @messages = @talk.messages
        if @message.save
            @talk.updated_at = Time.zone.now
            @talk.save
            flash[:success] = "Send message!"
            redirect_to talk_path(@talk)
        else
            render 'talks/show'
        end
    end

    private
        def message_params
            params.require(:message).permit(:content, :talk_id, :user_id, :image)
        end
end
