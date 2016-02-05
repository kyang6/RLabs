class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new

    if user.admin?

        can :manage, :all

        can :import, [User, Lab, Project, Publication]

    else

        can :update, Lab do |lab|
            lab.user == user
        end

        can :destroy, Lab do |lab|
            lab.user == user
        end

        can :create, Lab
    end
  end
end
