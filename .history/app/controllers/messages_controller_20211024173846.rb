class MessagesController < ApplicationController
    def new
        @message = current_user.messages.build
        @user = User.find(params[:id])
        current_user.talks.each do |talk|
            talk.members.each do |member|
                if member == @user
                    @talk = talk
                    redirect_to talk_path(talk)
                end
            end
        end
        unless @talk
            @talk = Talk.create!
            @talk.memberships.create!(user_id: current_user.id)
            @talk.memberships.create!(user_id: @user.id)
            redirect_to talk_path(@talk)
        end
    end

    private
        #該当するtalkを探し、存在すればそのtalk詳細ページにredirect
        def find_talk
            current_user.talks.each do |talk|
                talk.members.each do |member|
                    if member == @user
                        @talk = talk
                        redirect_to talk_path(talk)
                    end
                end
            end
        end
end
