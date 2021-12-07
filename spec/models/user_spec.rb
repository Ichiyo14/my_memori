# frozen_string_literal: true

require 'rails_helper'

RSpec.describe User, type: :model do
  it 'is valid with email and password' do
    user = described_class.new(
      email: 'abc@example.com',
      password: 'testtest'
    )
    expect(user).to be_valid
  end

  it 'is invalid without an email address' do
    user = described_class.new(email: nil)
    user.valid?
    expect(user.errors[:email]).to include('を入力してください')
  end

  it 'is invalid with a duplicate email address' do
    described_class.create(
      email: 'abc@example.com',
      password: 'testtest'
    )
    user = described_class.new(
      email: 'abc@example.com',
      password: 'testtest'
    )
    user.valid?
    expect(user.errors[:email]).to include('はすでに存在します')
  end
end
