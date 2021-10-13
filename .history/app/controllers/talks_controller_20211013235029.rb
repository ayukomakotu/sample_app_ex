class TalksController < ApplicationController
    before_action :logged_in_user, only: :index
    def index
        @talks = current_user.talks.paginate(page: params[:page])
    end

    def show
        debugger
        @talk = Talk.find(params[id])
    end
end
