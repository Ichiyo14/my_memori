# frozen_string_literal: true

class QuestionnaireForm
  include ActiveModel::Model

  attr_accessor :name, :order, :content, :tittle, :user_id, :factors_attributes, :questions_attributes, :description, :reference_url, :memo, :reference_memo,
                :average_score

  def initialize(params = {})
    super(params)
  end
end
