require 'rails_helper'
require 'faker'

RSpec.describe User, type: :model do
  FactoryBot.create(:user)

  it 'validates all fields presence' do
    @user_1 = create(:user)
    expect(@user_1).to be_valid
  end

  it 'returns error for email not present' do
    expect { 
      create(:user, email: '') 
    }.to raise_error(ActiveRecord::RecordInvalid, 
    "Validation failed: Email can't be blank")
  end

  it 'returns error for password not present' do
    expect {
      create(:user, password: '')
    }.to raise_error(ActiveRecord::RecordInvalid, 
    "Validation failed: Password can't be blank")
  end
end