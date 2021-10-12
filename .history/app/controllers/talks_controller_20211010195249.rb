class TalksController < ApplicationController
    def index
        @talks = current_user.talks.paginate(page: params[:page])
    end
end
