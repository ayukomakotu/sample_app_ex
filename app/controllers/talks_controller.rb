class TalksController < ApplicationController
    before_action :logged_in_user, only: :index
    def index
        @talks = current_user.talks.paginate(page: params[:page])
    end

    def show
        @talk = Talk.find(params[:id])
        @title = @talk.members.map(&:name).delete(current_user.name)
        @messages = @talk.messages
        @user = User.find(params[:id])
        @message = @user.messages.build
    end
end
