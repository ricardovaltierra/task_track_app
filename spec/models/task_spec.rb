require 'rails_helper'
require 'faker'

RSpec.describe Task, type: :model do
  FactoryBot.create(:user)

  it 'Validates all fields presence ✓' do
    @user = create(:user)
    @task = FactoryBot.create(:task, user_id: @user.id)
    expect(@task).to be_valid
    puts "
    Validates all fields presence
    --------------------------------
    User
    email: #{@user.email}
    password: #{@user.password}
    created_at: #{@user.created_at}
    updated_at: #{@user.updated_at}
    --------------------------------
    Task
    name: #{@task.name}
    description: #{@task.description}
    completion: #{@task.completion}
    user's id: #{@task.user.id}
    --------------------------------".
    colorize(:color => :light_blue)
  end

  it 'Returns error for name not present ✓' do
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

  it 'Returns error for description not present ✓' do
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

  it 'Returns error for completion not present ✓' do
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

  it 'Returns error for user\'s id not present ✓' do
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