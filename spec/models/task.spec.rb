require 'rails_helper'
require 'faker'

RSpec.describe Task, type: :model do
  FactoryBot.create(:user)

  it 'validates all fields presence' do
    @user = create(:user)
    @task = FactoryBot.create(:task, user_id: @user.id)
    expect(@task).to be_valid
  end

  it 'returns error for name not present' do
    @user = create(:user)
    expect {
      create(
        FactoryBot.create(
          :task, 
          user_id: @user.id,
          name: ''
          ))
    }.to raise_error(ActiveRecord::RecordInvalid,
    "Validation failed: Name can't be blank")
  end

  it 'returns error for description not present' do
    @user = create(:user)
    expect {
      create(
        FactoryBot.create(
          :task, 
          user_id: @user.id,
          description: ''
          ))
    }.to raise_error(ActiveRecord::RecordInvalid,
    "Validation failed: Description can't be blank")
  end

  it 'returns error for completion not present' do
    @user = create(:user)
    expect {
      create(
        FactoryBot.create(
          :task, 
          user_id: @user.id,
          completion: nil
          ))
    }.to raise_error(ActiveRecord::RecordInvalid,
    "Validation failed: Completion can't be blank")
  end

  it 'returns error for user\'s id not present' do
    expect {
      create(
      FactoryBot.create(
        :task,
        user_id: nil
      ))
    }.to raise_error(ActiveRecord::RecordInvalid,
    "Validation failed: User must exist, User can't be blank")
  end
end