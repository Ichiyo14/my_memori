# frozen_string_literal: true

class QuestionnaireForm
  include ActiveModel::Model

  attr_accessor :name, :order, :content, :tittle, :description,:user_id,
                :factors_attributes,
                :questions_attributes,
                :reference_url, :memo, :reference_memo,
                :average_score

  def initialize(params = {})
    super(params)
  end

  def save
    ActiveRecord::Base.transaction do
    @questionnaire = Questionnaire.create(tittle: tittle, user_id: user_id)
    @factors = factors_attributes.map{
      |factor| Factor.create!(
        name: factor[1][:name],
        order: factor[1][:order],
        questionnaire_id: @questionnaire.id
      )}
    @questions = questions_attributes.map{
      |question| Question.create!(
        content: question[1][:content],
        order: question[1][:order],
        factor_id: @factors[question[1][:factor_id].to_i].id,
        questionnaire_id: @questionnaire.id
      )}
      questions_attributes.each{
        |question|
        p question[1]
        @scales = question[1][:scales_attributes].map{
          |scale| Scale.create!(
            question_id:@questions[scale[1][:question_id].to_i].id,
            scale:scale[1][:scale],
            representation:scale[1][:representation],
          )
        }

      }
    end
  end
end
