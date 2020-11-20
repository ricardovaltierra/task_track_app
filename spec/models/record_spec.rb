require 'rails_helper'
require 'faker'

RSpec.describe Record, type: :model do
  FactoryBot.create(:user)

  it 'validates all fields presence' do
    @user = create(:user)
    @task = FactoryBot.create(:task, user_id: @user.id)
    @record = FactoryBot.create(:record,
      user_id: @user.id,
      task_id: @task.id)
    expect(@task).to be_valid
  end

  it 'returns error for percentage not present' do
    @user = create(:user)
    @task = FactoryBot.create(:task, user_id: @user.id)

    expect {
      create(
        FactoryBot.create(:record,
          percentage: nil,
          user_id: @user.id,
          task_id: @task.id
          ))
    }.to raise_error(ActiveRecord::RecordInvalid,
    "Validation failed: Percentage can't be blank")
  end

  it 'returns error for user\s id not present' do
    @user = create(:user)
    @task = FactoryBot.create(:task, user_id: @user.id)

    expect {
      create(
        FactoryBot.create(:record,
        task_id: @task.id
        ))
    }.to raise_error(ActiveRecord::RecordInvalid,
    "Validation failed: User must exist")
  end

  it 'returns error for task\s id not present' do
    @user = create(:user)

    expect {
      create(
        FactoryBot.create(:record,
        user_id: @user.id))
    }.to raise_error(ActiveRecord::RecordInvalid,
    "Validation failed: Task must exist")
  end
end