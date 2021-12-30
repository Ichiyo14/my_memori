# frozen_string_literal: true

class QuestionnaireForm
  include ActiveModel::Model

  attr_accessor :name, :order, :content, :tittle, :description, :user_id,
                :factors_attributes,
                :questions_attributes,
                :reference_url, :memo, :reference_memo,
                :average_score

  def initialize(params = {})
    super(params)
  end

  def save
    ActiveRecord::Base.transaction do
      @questionnaire = Questionnaire.create(tittle: tittle, user_id: user_id, memo: memo, reference_url: reference_url, reference_memo: reference_memo,
                                            description: description, average_score: average_score)
      @factors = factor_build
      @questions = question_build
      questions_attributes.each do |question|
        @scales = question[1][:scales_attributes].map do |scale|
          Scale.create!(
            question_id: @questions[scale[1][:question_id].to_i].id,
            scale: scale[1][:scale],
            representation: scale[1][:representation]
          )
        end
      end
    end
  end

  def factor_build
    factors_attributes.map do |factor|
      Factor.create!(
        name: factor[1][:name],
        order: factor[1][:order],
        questionnaire_id: @questionnaire.id
      )
    end
  end

  def question_build
    questions_attributes.map do |question|
      Question.create!(
        content: question[1][:content],
        order: question[1][:order],
        factor_id: @factors[question[1][:factor_id].to_i].id,
        questionnaire_id: @questionnaire.id
      )
    end
  end
end
