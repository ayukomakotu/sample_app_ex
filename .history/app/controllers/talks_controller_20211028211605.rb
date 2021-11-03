class TalksController < ApplicationController
    before_action :logged_in_user
    def index
        @talks = current_user.talks.paginate(page: params[:page])
    end

    def show
        @talk = Talk.find(params[:id])
        @title = @talk.members.map(&:name).delete(current_user.name)
        @talk.members.each do |member|
            if member != current_user
                @user = member
            end
        end
        @messages = @talk.messages
        @message = @user.messages.build
    end
end
