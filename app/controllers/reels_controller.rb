class ReelsController < ApplicationController
    def new
        @reel = Reel.new
      end
      def create
        @reel = Reel.new(reel_params)
    
        if @reel.save
          redirect_to @reel
        else
          render 'new'
        end
      end
    def reel_params
        params.require(:reel).permit( :attachment)
      end
      
end
