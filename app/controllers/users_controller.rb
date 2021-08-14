class UsersController < ApplicationController

        def show
          @user = User.find(params[:id]) 
        end

        private
        def tweet_params
          params.require(:tweet).permit(:trick)
        end
end
