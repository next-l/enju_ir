module EnjuIr
  class FilesetPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope.all
      end
    end

    def index?
      true
    end

    def show?
      DatasetPolicy.new(user, record.enju_ir_dataset).show?
    end

    def create?
      true
    end

    def update?
      DatasetPolicy.new(user, record.enju_ir_dataset).update?
    end

    def destroy?
      update?
    end
  end
end
