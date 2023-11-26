# frozen_string_literal: true

module ApplicationHelper
  def title(previous_title)
    previous_title || 'Software Development Experts'
  end
end
