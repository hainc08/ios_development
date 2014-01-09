class InfoServiceController < ApplicationController

	def getInfo
		@info = Info.find(:all, :order => "updated_at DESC")
		respond_to do |format|
      format.json { render :json => @info }
    end
	end

end
