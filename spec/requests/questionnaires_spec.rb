# frozen_string_literal: true

require 'rails_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to test the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator. If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails. There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.

RSpec.describe '/questionnaires', type: :request do
  # Questionnaire. As you add validations to Questionnaire, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  describe 'GET /index' do
    it 'renders a successful response' do
      Questionnaire.create! valid_attributes
      get questionnaires_url
      expect(response).to be_successful
    end
  end

  describe 'GET /show' do
    it 'renders a successful response' do
      questionnaire = Questionnaire.create! valid_attributes
      get questionnaire_url(questionnaire)
      expect(response).to be_successful
    end
  end

  describe 'GET /new' do
    it 'renders a successful response' do
      get new_questionnaire_url
      expect(response).to be_successful
    end
  end

  describe 'GET /edit' do
    it 'render a successful response' do
      questionnaire = Questionnaire.create! valid_attributes
      get edit_questionnaire_url(questionnaire)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      it 'creates a new Questionnaire' do
        expect do
          post questionnaires_url, params: { questionnaire: valid_attributes }
        end.to change(Questionnaire, :count).by(1)
      end

      it 'redirects to the created questionnaire' do
        post questionnaires_url, params: { questionnaire: valid_attributes }
        expect(response).to redirect_to(questionnaire_url(Questionnaire.last))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new Questionnaire' do
        expect do
          post questionnaires_url, params: { questionnaire: invalid_attributes }
        end.to change(Questionnaire, :count).by(0)
      end

      it "renders a successful response (i.e. to display the 'new' template)" do
        post questionnaires_url, params: { questionnaire: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested questionnaire' do
        questionnaire = Questionnaire.create! valid_attributes
        patch questionnaire_url(questionnaire), params: { questionnaire: new_attributes }
        questionnaire.reload
        skip('Add assertions for updated state')
      end

      it 'redirects to the questionnaire' do
        questionnaire = Questionnaire.create! valid_attributes
        patch questionnaire_url(questionnaire), params: { questionnaire: new_attributes }
        questionnaire.reload
        expect(response).to redirect_to(questionnaire_url(questionnaire))
      end
    end

    context 'with invalid parameters' do
      it "renders a successful response (i.e. to display the 'edit' template)" do
        questionnaire = Questionnaire.create! valid_attributes
        patch questionnaire_url(questionnaire), params: { questionnaire: invalid_attributes }
        expect(response).to be_successful
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested questionnaire' do
      questionnaire = Questionnaire.create! valid_attributes
      expect do
        delete questionnaire_url(questionnaire)
      end.to change(Questionnaire, :count).by(-1)
    end

    it 'redirects to the questionnaires list' do
      questionnaire = Questionnaire.create! valid_attributes
      delete questionnaire_url(questionnaire)
      expect(response).to redirect_to(questionnaires_url)
    end
  end
end
