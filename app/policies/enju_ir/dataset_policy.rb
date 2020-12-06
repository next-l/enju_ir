module EnjuIr
  class DatasetPolicy < ApplicationPolicy
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
      true
    end

    def update?
      return true if user == record.user
    end

    def destroy?
      update?
    end
  end
end
