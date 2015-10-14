module Api
  module V1
    class SportsController < ApplicationController

      def index
        getter = Sports::Get.new content
        sports = getter.call

        render json: sports
      end

      private 
      
      def content
        content = BetVictor::Content.new
        content.get
      end
    end
  end
end 