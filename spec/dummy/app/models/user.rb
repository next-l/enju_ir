class User < ApplicationRecord
  devise :database_authenticatable, #:registerable,
         :recoverable, :rememberable, :trackable, # , :validatable
         :lockable, lock_strategy: :none, unlock_strategy: :none

  include EnjuSeed::EnjuUser
#  belongs_to :profile
#      has_one :user_has_role, dependent: :destroy
#      has_one :role, through: :user_has_role
end
