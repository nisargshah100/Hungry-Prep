class HomeController < ApplicationController
	def index
		redirect_to edit_candidate_path(current_user.candidate) if current_user
	end
end