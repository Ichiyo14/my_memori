# frozen_string_literal: true

class QuestionnaireForm
  include ActiveModel::Model

  attr_accessor :name, :order, :content, :tittle, :user_id, :factors_attributes, :questions_attributes, :description, :reference_url, :memo, :reference_memo,
                :average_score

  def initialize(params = {})
    super(params)
  end

  def save
    ActiveRecord::Base.transaction do
    @questionnaire = Questionnaire.create(tittle: tittle, user_id: user_id)
    @factors = factors_attributes.map{|factor| Factor.create(name: factor[1][:name], order: factor[1][:order], questionnaire_id: @questionnaire.id)}
    end
  end
end
