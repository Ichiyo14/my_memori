# frozen_string_literal: true

class ApplicationController < ActionController::Base
  def after_sign_in_path_for(_resource)
    questions_path(current_user)
  end

  def after_sign_up_path_for(_resource)
    questions_path(current_user)
  end

  def after_sign_out_path_for(_resource)
    root_path
  end
end
