module EnjuIr
  class CollectionPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope.all
      end
    end

    def index?
      true
    end

    def show?
      true
    end

    def create?
      return true if user
    end

    def update?
      return true if user == record.user
    end

    def destroy?
      update?
    end
  end
end
