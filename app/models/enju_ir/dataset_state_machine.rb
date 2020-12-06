module EnjuIr
  class DatasetStateMachine
    include Statesman::Machine

    state :pending, initial: true
    state :draft
    state :published
  end
end
