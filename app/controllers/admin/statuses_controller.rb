class Admin::StatusesController < Admin::AdminController
  authorize_resource

  def update
    @candidate = Candidate.find(params[:id])
    render :json => params
  end

end