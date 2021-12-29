# frozen_string_literal: true

class QuestionnaireFormsController < ApplicationController
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
end
