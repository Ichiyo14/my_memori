# frozen_string_literal: true

class QuestionnaireFormsController < ApplicationController
  before_action :authenticate_user!
  def new
    @questionnaire_form = QuestionnaireForm.new
  end

  def create
    @questionnaire_form = QuestionnaireForm.new(set_params.merge(user_id: current_user.id))

    respond_to do |format|
      if @questionnaire_form.save
        format.html { redirect_to questions_new_path, notice: 'Questionnaire was successfully created.' }
        format.json { render :show, status: :created, location: @questionnaire_form }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @questionnaire_form.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def set_params
    params.require(:questionnaire_form).permit(
      :description,
      :user_id,
      :reference_url,
      :tittle,
      :memo,
      :reference_memo,
      :average_score,
      questions_attributes: [
        :factor_id, :order, :content,
        scales_attributes:[:scale,:representation,:question_id]
      ],
      factors_attributes: [:name,:order])
    end

end
