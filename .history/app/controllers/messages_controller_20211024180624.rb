class MessagesController < ApplicationController
    def new
        @message = current_user.messages.build
        @user = User.find(params[:id])
        find_talk
        unless @talk
            create_talk
        end
        redirect_to talk_path(@talk)
    end

    def create

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
