# frozen_string_literal: true

class PagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user:)
    end
  end
end
