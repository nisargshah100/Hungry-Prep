class Admin::DashboardController < Admin::AdminController
  def index
  end

  def show
    last_statuses =Candidate.all.collect do |candidate|
      candidate.status
    end
    total = last_statuses.count
    status_hash = Hash.new

    last_statuses.each do |status|
      if status_hash[status]
        status_hash[status] += 1
      else
        status_hash[status] = 1
      end
    end

    status_hash.each do |status, count|
      status_hash[status] = ((count.to_f)/(total.to_f)).to_i
    end

    # @statuses = [ status_hash["Unfinished"],
    #               status_hash["Submitted"],
    #               status_hash["Unreviewed"],
    #               status_hash["Interviewed"],
    #               (status_hash["Accepted"]+status_hash["Declined"])]

    @statuses = Candidate.all
  end

end


[ "Unfinished", "Submitted", "Unreviewed", "Interviewed", "Decision Made" ]