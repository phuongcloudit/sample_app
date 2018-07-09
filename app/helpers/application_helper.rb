# frozen_string_literal: true

module ApplicationHelper
  # Returns the full title on a per-page basis.       # Documentation comment
  # Method def, optional arg
  def full_title page_title = ""
    base_title = t ".base_title"  # Variable assignment
    if page_title.empty?                              # Boolean test
      base_title                                      # Implicit return
    else
      page_title + " | " + base_title                 # String concatenation
    end
  end
end
