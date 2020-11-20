require 'rails_helper'
require 'faker'
require 'colorize'

RSpec.describe User, type: :model do
  FactoryBot.create(:user)

  it 'Validates all fields presence ✓' do
    @user = create(:user)
    expect(@user).to be_valid
    puts "
    Validates all fields presence
    --------------------------------
    email: #{@user.email}
    password: #{@user.password}
    created_at: #{@user.created_at}
    updated_at: #{@user.updated_at}
    --------------------------------".
    colorize(:color => :light_blue)
  end

  it 'Returns error for email not present ✓' do
    expect { 
      create(:user, email: '') 
    }.to raise_error(ActiveRecord::RecordInvalid, 
    "Validation failed: Email can't be blank")
  end

  it 'Returns error for password not present ✓' do
    expect {
      create(:user, password: '')
    }.to raise_error(ActiveRecord::RecordInvalid, 
    "Validation failed: Password can't be blank")
  end
end