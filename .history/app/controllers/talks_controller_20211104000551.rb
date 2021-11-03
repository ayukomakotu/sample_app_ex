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

    def create
        @user = User.find(params[:user_id])
        find_talk
        create_talk unless @talk
        redirect_to talk_path(@talk)
    end

    private
        #該当するtalkを探し、存在すればインスタンス(@talk)に代入
        def find_talk
            current_user.talks.each do |talk|
                talk.members.each do |member|
                    if member == @user
                        @talk = talk
                    end
                end
            end
        end

        #新たにtalkを作成
        def create_talk
            @talk = Talk.create!
            @talk.memberships.create!(user_id: current_user.id)
            @talk.memberships.create!(user_id: @user.id)
        end
end
