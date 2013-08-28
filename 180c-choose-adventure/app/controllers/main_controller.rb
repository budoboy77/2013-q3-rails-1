class MainController < ApplicationController
	def scene_get
		@scene = Scene.find(params[:id])
		render :scene
	end
	def root
		redirect_to "/scene/#{Scene.find(1).id}"
	end
end
