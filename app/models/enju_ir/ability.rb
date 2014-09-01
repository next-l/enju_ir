module EnjuIr
  class Ability
    include CanCan::Ability

    def initialize(user, ip_address = nil)
      case user.try(:role).try(:name)
      when 'Administrator'
        can :manage, Resource
      when 'Librarian'
        can :manage, Resource
      when 'User'
        can :read, Resource
      else
        can :read, Resource
      end
    end
  end
end
