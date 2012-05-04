class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user and user.reviewer
      can :read, Candidate do |candidate|
        candidate.reviewers.include?(user)
      end
    end

  end
end
