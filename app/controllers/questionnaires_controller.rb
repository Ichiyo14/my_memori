# frozen_string_literal: true

class QuestionnairesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_questionnaire, only: %i[show edit update destroy]

  def index
    @questionnaires = Questionnaire.all
    @answerable_questionnaires_id = answerable_questionnaires_id
  end

  def show; end

  def update
    respond_to do |format|
      if @questionnaire.update(questionnaire_params)
        format.html { redirect_to @questionnaire, notice: 'Questionnaire was successfully updated.' }
        format.json { render :show, status: :ok, location: @questionnaire }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @questionnaire.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @questionnaire.destroy
    respond_to do |format|
      format.html { redirect_to questionnaires_url, notice: 'Questionnaire was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_questionnaire
    @questionnaire = Questionnaire.find(params[:id])
  end

  def answerable_questionnaires_id
    AnswerableQuestionnaire.where(user_id: current_user.id).map { |answerable_questionnaire| answerable_questionnaire&.questionnaire_id }
  end
end
