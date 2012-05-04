class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user and user.reviewer
      can :read, Candidate do |candidate|
        candidate.reviewers.include?(user.reviewer)
      end
    end

    if user and user.is_admin?
      can :manage, Candidate
      can :manage, Reviewer
      can :manage, Milestone
      can :manage, Response
    end

  end
end
