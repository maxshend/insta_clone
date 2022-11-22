# frozen_string_literal: true

class DashboardController < ApplicationController
  def show
    @pages = policy_scope(Page)
  end
end
