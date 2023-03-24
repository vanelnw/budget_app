# frozen_string_literal: true

class Ability
  include CanCan::Ability

  def initialize(user)
    can :read, Category
    can :create, Category
    can :write, Category

    can :read, Transaction
    can :create, Transaction

    return unless user.present?

    can :destroy, Category, user: user
    can :destroy, Transaction, user: user
  end
end
