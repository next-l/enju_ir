module EnjuIr
  class FilesetPolicy < ApplicationPolicy
    class Scope < Scope
      def resolve
        scope.all
      end
    end
  end
end
